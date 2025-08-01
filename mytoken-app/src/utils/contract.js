import { ethers } from "ethers";
import { BrowserProvider, Contract, parseUnits, formatUnits } from "ethers";

import tokenAbi from "../abi/MyCoin.json";

const CONTRACT_ADDRESS = "0xYourContractAddressHere";

export const getContract = () => {
  const provider = new BrowserProvider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(CONTRACT_ADDRESS, tokenAbi.abi, signer);
  return contract;
};
