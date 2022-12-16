## Steps to replicate test

After cloning code locally:

1. run bitcoind in one console window: `./bitcoind -regtest`
2. run bitcoin-cli in another window: `./bitcoin-cli -regtest generatetoaddress 16 bcrt1qttuwhmpa7a0ls5kr3ye6pjc24ng685jvdrksxx`
3. run the pool roll in another window: `cargo run pool`
4. run the translator proxy in debug mode in another window: `RUST_LOG=debug cargo run translator`
5. in another window, in the `utils/message-generator` dir, run: `cargo run ../test_bad_msg.json`

### Result breakdown:

The message generator window logs the output of the test, and shows that both messages are sent.

The translator proxy window shows the error that we're interested in. `PROXY SERVER - ACCEPTING FROM DOWNSTREAM: 127.0.0.1:XXXXX` shows that the connection is made and the channel is open.

#### Note 1: 
Only one `Receiving from Mining Device: ...` log is displayed.  The second message does not create another log like this because the first one panicked and closed the channel.

#### Note 2: 
The test can be re-run repeatedly without a restart of either the pool or the translator proxy.  This shows that neither crashed as a result, and all that needs to happen for the translator proxy to receive another connection is for the miner to initialize the connection.

#### Note 3:
In the test console, the resulting `TEST OK` output simply shows that the test ran to completion.  This test does not include any actual checks for this failure case - this can hopefully happen soon.