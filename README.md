# MOE Soulbound Token

MOE Soulbound Token is a means to verify the validity of a specific address.

## Env.

```bash
npm install
cp .env.sample .env
vi .env
```

## Deploy

```bash
npx hardhat run --network {ethereum||sepolia} "scripts/deploy.js"
```

## Verify

```bash
npx hardhat verify --constructor-args arguments.js --contract "contracts/MOESoulboundToken.sol:MOESoulboundToken" --network {ethereum||sepolia} {CONTRACT_ADDRESS}
```