import { ethers } from "ethers";
import tokenAbi from "../abi/MyToken.json";

const CONTRACT_ADDRESS = "0xYourContractAddressHere";

export const getContract = () => {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(CONTRACT_ADDRESS, tokenAbi, signer);
  return contract;
};
