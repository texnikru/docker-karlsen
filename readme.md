# How to create wallet

You need to start wallet daemon which connects to coin node.
No need to wait till synchronization complete.

All sources in `Dockerfile`. Based on v1.0.0.

### Run coin node

All node data stored in `data` folder.

```sh
docker run --rm -ti --name karlsen-node -v $(pwd)/data:/root/.karlsend/ -p 42110:42110 -p 42111:42111 texnikru/karlsen ./karlsend --utxoindex
```

* For background node add `-d` flag

### Create wallet keys

All wallet data stored in `wallet` folder.

```sh
docker run --rm -ti --name karlsen-daemon -v $(pwd)/wallet:/root/.karlsenwallet/ -p 8082:8082 texnikru/karlsen ./karlsenwallet create
```

* For background node add `-d` flag

### Run wallet daemon

```sh
docker run --rm -ti --name karlsen-daemon -v $(pwd)/wallet:/root/.karlsenwallet/ -p 8082:8082 texnikru/karlsen ./karlsenwallet start-daemon -s host.docker.internal:42110
```

# Wallet commands

### Dump mnemonic for wallet

```sh
docker exec -ti karlsen-daemon ./karlsenwallet dump-unencrypted-data
```

### Create new wallet address

```sh
docker exec -ti karlsen-daemon ./karlsenwallet new-address
```

### View balances

```sh
docker exec -ti karlsen-daemon ./karlsenwallet balance
```