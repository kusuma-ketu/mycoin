import React, { useEffect, useState } from "react";
import { getContract } from "./utils/contract";
import { ethers } from "ethers";
import { parseUnits, formatUnits } from "ethers";


function App() {
  const [account, setAccount] = useState(null);
  const [balance, setBalance] = useState("0");

  const connectWallet = async () => {
    if (window.ethereum) {
      const [selectedAccount] = await window.ethereum.request({ method: "eth_requestAccounts" });
      setAccount(selectedAccount);
    } else {
      alert("Please install MetaMask!");
    }
  };

  const getBalance = async () => {
    const contract = getContract();
    const rawBalance = await contract.balanceOf(account);
    setBalance(formatUnits(rawBalance, 18));
  };

  const transferTokens = async () => {
    const contract = getContract();
    const recipient = prompt("Enter recipient address:");
    const amount = prompt("Enter amount to send:");
    const tx = await contract.transfer(recipient, parseUnits(amount, 18));
    await tx.wait();
    alert("Transfer successful!");
    getBalance();
  };

  useEffect(() => {
  const fetch = async () => {
    try {
      await getBalance();
    } catch (e) {
      console.error("Error in useEffect:", e);
    }
  };
  fetch();
}, []);


  return (
    <div style={{ padding: "2rem" }}>
      <h1>MyToken Dashboard</h1>
      {!account ? (
        <button onClick={connectWallet}>Connect Wallet</button>
      ) : (
        <>
          <p>Connected: {account}</p>
          <p>Balance: {balance} MTK</p>
          <button onClick={transferTokens}>Send Tokens</button>
        </>
      )}
    </div>
  );
}

export default App;
