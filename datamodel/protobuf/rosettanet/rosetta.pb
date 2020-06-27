
3.0.2w
Rosetta&A Standard for Blockchain Interaction
*=

Apache 2.0/http://www.apache.org/licenses/LICENSE-2.0.html21.3.1"å?
¥
/network/list¢2ü
NetworkGet List of Available NetworksWThis endpoint returns a list of NetworkIdentifiers that the Rosetta
server can handle.
*networkList:F
D@
>
application/json*
(&
$#/components/schemas/MetadataRequestB≈
L
J
unexpected error6
4
application/json 

#/components/schemas/Erroru
200n
l
$Expected response to a valid requestD
B
application/json.
,*
(#/components/schemas/NetworkListResponse
Â
/network/status—2Œ
NetworkGet Network StatuséThis endpoint returns the current status of the network requested. Any
NetworkIdentifier returned by /network/list should be accessible here.
*networkStatus:E
C?
=
application/json)
'%
##/components/schemas/NetworkRequestB«
L
J
unexpected error6
4
application/json 

#/components/schemas/Errorw
200p
n
$Expected response to a valid requestF
D
application/json0
.,
*#/components/schemas/NetworkStatusResponse
í
/network/options˝2˙
NetworkGet Network Options∑This endpoint returns the version information and allowed
network-specific types for a NetworkIdentifier. Any
NetworkIdentifier returned by /network/list should be accessible here.

Because options are retrievable in the context of a NetworkIdentifier,
it is possible to define unique options for each network.
*networkOptions:E
C?
=
application/json)
'%
##/components/schemas/NetworkRequestB»
L
J
unexpected error6
4
application/json 

#/components/schemas/Errorx
200q
o
$Expected response to a valid requestG
E
application/json1
/-
+#/components/schemas/NetworkOptionsResponse
˙
/blockÔ2Ï
BlockGet a Block«Get a block by its Block Identifier. If transactions are returned in
the same call to the node as fetching the block, the response should
include these transactions in the Block object. If not, an array of
Transaction Identifiers should be returned so /block/transaction
fetches can be done to get all transaction information.
*block:C
A=
;
application/json'
%#
!#/components/schemas/BlockRequestBø
L
J
unexpected error6
4
application/json 

#/components/schemas/Erroro
200h
f
$Expected response to a valid request>
<
application/json(
&$
"#/components/schemas/BlockResponse
≤
/block/transactionõ2ò
BlockGet a Block Transaction∆Get a transaction in a block by its Transaction Identifier. This endpoint
should only be used when querying a node for a block does not return all
transactions contained within it.

All transactions returned by this endpoint must be appended to any
transactions returned by the /block method by consumers of this data.
Fetching a transaction by hash is considered an Explorer Method
(which is classified under the Future Work section).

Calling this endpoint requires reference to a BlockIdentifier because
transaction parsing can change depending on which block contains the
transaction. For example, in Bitcoin it is necessary to know which block
contains a transaction to determine the destination of fee payments.
Without specifying a block identifier, the node
would have to infer which block to use (which could change during a re-org).

Implementations that require fetching previous transactions to populate
the response (ex: Previous UTXOs in Bitcoin) may find it useful to run a
cache within the Rosetta server in the /data directory
(on a path that does not conflict with the node).
*blockTransaction:N
LH
F
application/json2
0.
,#/components/schemas/BlockTransactionRequestB 
L
J
unexpected error6
4
application/json 

#/components/schemas/Errorz
200s
q
$Expected response to a valid requestI
G
application/json3
1/
-#/components/schemas/BlockTransactionResponse
˚
/mempoolÓ2Î
MempoolGet All Mempool Transactions.Get all Transaction Identifiers in the mempool*mempool:E
C?
=
application/json)
'%
##/components/schemas/MempoolRequestB¡
L
J
unexpected error6
4
application/json 

#/components/schemas/Errorq
200j
h
$Expected response to a valid request@
>
application/json*
(&
$#/components/schemas/MempoolResponse
£
/mempool/transactionä2á
MempoolGet a Mempool Transaction´Get a transaction in the mempool by its Transaction Identifier. This is
a separate request than fetching a block transaction (/block/transaction)
because some blockchain nodes need to know that a transaction query is
for something in the mempool instead of a transaction in a block.

Transactions may not be fully parsable until they are in a block (ex: may
not be possible to determine the fee to pay before a transaction is
executed). On this endpoint, it is ok that returned transactions are
only estimates of what may actually be included in a block.
*mempoolTransaction:P
NJ
H
application/json4
20
.#/components/schemas/MempoolTransactionRequestBÃ
L
J
unexpected error6
4
application/json 

#/components/schemas/Error|
200u
s
$Expected response to a valid requestK
I
application/json5
31
/#/components/schemas/MempoolTransactionResponse
¯
/account/balance„2‡
AccountGet an Account BalanceìGet an array of all Account Balances for an Account Identifier and the
Block Identifier at which the balance lookup was performed.

Some consumers of account balance data need to know at which block the
balance was calculated to reconcile account balance changes.

To get all balances associated with an account, it may be necessary to
perform multiple balance requests with unique Account Identifiers.

If the client supports it, passing nil AccountIdentifier metadata to
the request should fetch all balances (if applicable).

It is also possible to perform a historical balance lookup (if the server
supports it) by passing in an optional BlockIdentifier.
*accountBalance:L
JF
D
application/json0
.,
*#/components/schemas/AccountBalanceRequestB»
L
J
unexpected error6
4
application/json 

#/components/schemas/Errorx
200q
o
$Expected response to a valid requestG
E
application/json1
/-
+#/components/schemas/AccountBalanceResponse
Î	
/construction/metadata–	2Õ	
Construction%Get Transaction Construction Metadata⁄Get any information required to construct a transaction for a specific
network. Metadata returned here could be a recent hash to use, an
account sequence number, or even arbitrary chain state. It is up to the
client to correctly populate the options object with any
network-specific details to ensure the correct metadata is retrieved.

It is important to clarify that this endpoint should not pre-construct
any transactions for the client (this should happen in the SDK). This
endpoint is left purposely unstructured because of the wide scope
of metadata that could be required.

In a future version of the spec, we plan to pass an array of Rosetta
Operations to specify which metadata should be received and to create
a transaction in an accompanying SDK. This will help to insulate the
client from chain-specific details that are currently required here.
*constructionMetadata:R
PL
J
application/json6
42
0#/components/schemas/ConstructionMetadataRequestBŒ
L
J
unexpected error6
4
application/json 

#/components/schemas/Error~
200w
u
$Expected response to a valid requestM
K
application/json7
53
1#/components/schemas/ConstructionMetadataResponse
ñ
/construction/submit˝2˙
ConstructionSubmit a Signed TransactionóSubmit a pre-signed transaction to the node. This call should not block
on the transaction being included in a block. Rather, it should return
immediately with an indication of whether or not the transaction was
included in the mempool.

The transaction submission response should only return a 200 status
if the submitted transaction could be included in the mempool.
Otherwise, it should return an error.
*constructionSubmit:P
NJ
H
application/json4
20
.#/components/schemas/ConstructionSubmitRequestBÃ
L
J
unexpected error6
4
application/json 

#/components/schemas/Error|
200u
s
$Expected response to a valid requestK
I
application/json5
31
/#/components/schemas/ConstructionSubmitResponse*ßî
£î
…
NetworkIdentifier≥
∞∫blockchain - network object˙≤


blockchain
	 string
‡
network‘
—:
mainnet
 stringí∏If a blockchain has a specific chain-id or network identifier, it
should go in this field. It is up to the client to determine which
network-specific identifier is mainnet or testnet.

2
sub_network_identifier
SubNetworkIdentifieríWThe network_identifier specifies which network a particular object is associated with.

€
SubNetworkIdentifier¬
ø∫network object˙v
"
network
:
shard 1
 string
P
metadataD
B:75producer: 0x52bc44d5378309ee2abf1539bf71de1b7d7be3b5
 objectíØIn blockchains with sharded state, the SubNetworkIdentifier
is required to query some object on a specific shard. This identifier is
optional for all non-sharded blockchains.

≤
BlockIdentifierû
õ∫index∫hash object˙≤
T
indexK
I:
1123941
 integerí(This is also known as the block height.
öint64
Z
hashR
P:EC0x1f2cc6c5027d2f201a5453ad1119574d2aed23a392654742ac3c78783c071f85
 stringíJThe block_identifier uniquely identifies a block in a particular network.

˝
PartialBlockIdentifier‚
ﬂ object˙á
)
index 
:
1123941
 integeröint64
Z
hashR
P:EC0x1f2cc6c5027d2f201a5453ad1119574d2aed23a392654742ac3c78783c071f85
 stringí«When fetching data by BlockIdentifier, it may be possible to only specify the
index or hash. If neither property is specified, it is assumed that the
client is making a request at the current block.

á
TransactionIdentifierÌ
Í∫hash object˙·
ﬁ
hash’
“:EC0x2f23fd8cca835af21f3ac375bac601f97ead75f2e79143bdf71fe2c4be043e8f
 stringíAny transactions that are attributable only to a block (ex: a block event)
should use the hash of the block as the identifier.
írThe transaction_identifier uniquely identifies a transaction in a particular network and block
or in the mempool.

·
OperationIdentifier…
∆∫index object˙ﬁ
Ó
index‰
·:1
 integerí≈The operation index is used to ensure each operation has a unique identifier within
a transaction.

To clarify, there may not be any notion of an operation index in the blockchain being described.
öint64
Í
network_indexÿ
’:0
 integeríπSome blockchains specify an operation index that is essential for client use. For example,
Bitcoin uses a network_index to identify which UTXO was used in a transaction.

network_index should not be populated if there is no notion of an operation index in a
blockchain (typically most account-based blockchains).
öint64íPThe operation_identifier uniquely identifies an operation within a transaction.

°
AccountIdentifierã
à∫address object˙®
©
addressù
ö:-+0x3a065000ab4183c6bf581dc1e55a605455fc6d61
 stringí_The address may be a cryptographic public key (or some encoding of it) or a provided username.

'
sub_account
SubAccountIdentifier
–
metadata√
¿ objectí≥Blockchains that utilize a username model (where the address is not a derivative of a cryptographic
public key) should specify the public key(s) owned by the address in metadata.
í≈The account_identifier uniquely identifies an account within a network.
All fields in the account_identifier are utilized to determine this uniqueness
(including the metadata field, if populated).

Ü
SubAccountIdentifierÌ
Í∫address object˙˘
À
addressø
º:-+0x6b175474e89094c44da98b954eedeac495271d0f
 stringíÄThe SubAccount address may be a cryptographic value or some
other identifier (ex: bonded) that uniquely specifies a SubAccount.

®
metadataõ
ò objectíãIf the SubAccount address is not sufficient to uniquely specify a SubAccount,
any other identifying information can be stored here.

It is important to note that two SubAccounts with identical addresses but
differing metadata will not be considered equal by clients.
í÷An account may have state specific to a contract address (ERC-20 token)
and/or a stake (delegated balance). The sub_account_identifier should
specify which state (if applicable) an account instantiation refers to.

¯
BlockÓ
Î∫block_identifier∫parent_block_identifier∫	timestamp∫transactions object˙º
'
block_identifier
BlockIdentifier
.
parent_block_identifier
BlockIdentifier

	timestamp
	Timestamp
.
transactions
 arrayÚ

Transaction
î
metadataá
Ñ:ywtransactions_root: 0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347
difficulty: "123891724987128947"
 objectíWBlocks contain an array of Transactions that
occurred at a particular BlockIdentifier.

˙
TransactionÍ
Á∫transaction_identifier∫
operations object˙Ã
3
transaction_identifier
TransactionIdentifier
*

operations
 arrayÚ

	Operation
Ë
metadata€
ÿ:#!size: 12378
lockTime: 1582272577
 objectí¶Transactions that are related to other transactions (like a cross-shard transactioin) should include
the tranaction_identifier of these transactions in the metadata.
íeTransactions contain an array of Operations
that are attributable to the same TransactionIdentifier.

¬
	Operation¥
±∫operation_identifier∫type∫status object˙π
/
operation_identifier
OperationIdentifier
ù
related_operationsÜ
É:20- index: 0
  operation_identifier:
    index: 0
 arrayÚ

OperationIdentifieríßRestrict referenced related_operations to identifier indexes
< the current operation_identifier.index. This ensures there
exists a clear DAG-structure of relations.

Since operations are one-sided, one could imagine relating operations
in a single transfer or linking operations in a call tree.

Ù
typeÎ
Ë:	Transfer
 stringíŒThe network-specific type of the operation. Ensure that any type that can be returned here is also
specified in the NetowrkStatus. This can be very useful to downstream consumers that parse all
block data.

ﬂ
status‘
—:	Reverted
 stringí∑The network-specific status of the operation. Status is not defined on the transaction object
because blockchains with smart contracts may have transactions that partially apply.

Blockchains with atomic transactions (all operations succeed or all operations fail) will have
the same status for each operation.

 
account
AccountIdentifier

amount

Amount
‘
metadata«
ƒ:∏µasm: 304502201fd8abb11443f8b1b9a04e0495e0543d05611473a790c8939f089d073f90509a022100f4677825136605d732e2126d09a2d38c20c75946cd9fc239c0497e84c634e3dd01 03301a8259a12e35694cc22ebc45fee635f4993064190f6ce96e7fb19a03bb6be2
hex: 48304502201fd8abb11443f8b1b9a04e0495e0543d05611473a790c8939f089d073f90509a022100f4677825136605d732e2126d09a2d38c20c75946cd9fc239c0497e84c634e3dd012103301a8259a12e35694cc22ebc45fee635f4993064190f6ce96e7fb19a03bb6be2
 objectí¿Operations contain all balance-changing information within a
transaction. They are always one-sided (only affect 1 AccountIdentifier)
and can succeed or fail independently from a Transaction.

ñ
Amountã
à∫value∫currency object˙Å
À
value¡
æ:"1238089899992"
 stringíùValue of the transaction in atomic units represented as an arbitrary-sized signed integer.

For example, 1 BTC would be represented by a value of 100000000.


currency

Currency

metadata
	 objectídAmount is some Value of a Currency.
It is considered invalid to specify a Value without a Currency.

å
Currencyˇ
¸∫symbol∫decimals object˙¨
M
symbolC
A:BTC
 stringí-Canonical symbol associated with a currency.

Ñ
decimals˜
Ù:8
 integeríÿNumber of decimal places in the standard unit representation of the amount.

For example, BTC has 8 decimals. Note that it is not possible to represent
the value of some currency in atomic units that is not base 10.
öint32
”
metadata∆
√:Issuer: Satoshi
 objectí¢Any additional information related to the currency itself.

For example, it would be useful to populate this object with the contract address
of an ERC-20 token.
í´Currency is composed of a canonical Symbol and
Decimals. This Decimals value is used to convert
an Amount.Value from atomic units (Satoshis) to standard units
(Bitcoins).

≤
Peer©
¶∫peer_id object˙`
E
peer_id:
8:-+0x52bc44d5378309ee2abf1539bf71de1b7d7be3b5
 string

metadata
	 objectí-A Peer is a representation of a node's peer.

Ï
Version‡
›∫rosetta_version∫node_version object˙±
Õ
rosetta_versionπ
∂:1.2.5
 stringíüThe rosetta_version is the version of the Rosetta interface
the implementation adheres to. This can be useful for clients
looking to reliably parse responses.

í
node_versionÅ
:1.0.2
 stringíiThe node_version is the canonical version of the node
runtime. This can help clients manage deployments.

√
middleware_version¨
©:0.2.7
 stringííWhen a middleware server is used to adhere to the Rosetta
interface, it should return its version here. This can help
clients manage deployments.

É
metadataw
u objectíiAny other information that may be useful about versioning
of dependent services should be returned here.
í{The Version object is utilized to inform the client
of the versions of different components of the Rosetta
implementation.

£
Allowô
ñ∫operation_statuses∫operation_types∫errors object˙Ä
€
operation_statusesƒ
¡ arrayÚ

OperationStatusíùAll Operation.Status this implementation supports. Any status
that is returned during parsing that is not listed here will cause
client validation to error.

Ÿ
operation_types≈
¬ arrayÚ

:	TRANSFER
 stringíôAll Operation.Type this implementation supports. Any type
that is returned during parsing that is not listed here will
cause client validation to error.

√
errors∏
µ arrayÚ
	
ErroríõAll Errors that this implementation could return. Any error
that is returned during parsing that is not listed here will
cause client validation to error.
í’Allow specifies supported Operation status, Operation types,
and all possible error statuses. This Allow object is used by
clients to validate the correctness of a Rosetta Server implementation. It is
expected that these clients will error if they receive some response
that contains any of the above information that is not specified here.

à
Error˛
˚∫code∫message∫	retriable object˙π
Ü
code~
| integerígCode is a network-specific error code. If desired, this code
can be equivalent to an HTTP status code.
öint32
F
message;
9 stringí-Message is a network-specific error message.

f
	retriableY
W booleaníJAn error is retriable if the same request may succeed if submitted
again.
íîInstead of utilizing HTTP status codes to describe node errors (which often
do not have a good analog), rich errors are returned using this object.

ı
OperationStatus·
ﬁ:#!status: SUCCESS
successful: true
∫status∫
successful object˙π
T
statusJ
H stringí<The status is the network-specific status of the operation.

‡

successful—
Œ booleaní¿An Operation is considered successful if the Operation.Amount
should affect the Operation.Account. Some blockchains (like Bitcoin)
only include successful operations in blocks but other blockchains
(like Ethereum) include unsuccessful operations that incur a fee.

To reconcile the computed balance from the stream of Operations,
it is critical to understand which Operation.Status indicate an
Operation is successful and should affect an Account.
íZOperationStatus is utilized to indicate which Operation
status are considered successful.

È
	Timestamp€
ÿ:1582833600000
 integerí∞The timestamp of the block in milliseconds since the Unix Epoch. The timestamp is stored in
milliseconds because some blockchains produce blocks more often than once a second.
öint64
ÿ
AccountBalanceRequestæ
ª∫network_identifier∫account_identifier object˙…
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
@
account_identifier*(
&#/components/schemas/AccountIdentifier
C
block_identifier/-
+#/components/schemas/PartialBlockIdentifierí∑An AccountBalanceRequest is utilized to make a balance request
on the /account/balance endpoint. If the block_identifier is populated,
a historical balance query should be performed.

ä
AccountBalanceResponseÔ
Ï∫block_identifier∫balances object˙≥
<
block_identifier(&
$#/components/schemas/BlockIdentifier
y
balancesm
k arrayÚ!

#/components/schemas/Amountí<A single account may have a balance in multiple currencies.

˜
metadataÍ
Á:sequence_number: 23
 objectí¬Account-based blockchains that utilize a nonce or sequence number
should include that number in the metadata. This number could be
unique to the identifier or global across the account address.
íäAn AccountBalanceResponse is returned on the /account/balance endpoint.
If an account has a balance for each AccountIdentifier describing it
(ex: an ERC-20 token balance on a few smart contracts), an account
balance request must be made with each AccountIdentifier.

û
BlockRequestç
ä∫network_identifier∫block_identifier object˙á
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
C
block_identifier/-
+#/components/schemas/PartialBlockIdentifieríKA BlockRequest is utilized to make a block request on the
/block endpoint.

Ò
BlockResponseﬂ
‹∫block object˙≤
'
block
#/components/schemas/Block
Ü
other_transactionsÔ
Ï arrayÚ0
.,
*#/components/schemas/TransactionIdentifierí≠Some blockchains may require additional transactions to be fetched
that weren't returned in the block response
(ex: block only returns transaction hashes). For blockchains with a
lot of transactions in each block, this
can be very useful as consumers can concurrently fetch all
transactions returned.
íëA BlockResponse includes a fully-populated block or a partially-populated
block with a list of other transactions to fetch (other_transactions).

∞
BlockTransactionRequestî
ë∫network_identifier∫block_identifier∫transaction_identifier object˙ 
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
<
block_identifier(&
$#/components/schemas/BlockIdentifier
H
transaction_identifier.,
*#/components/schemas/TransactionIdentifierívA BlockTransactionRequest is used to fetch a Transaction included in a
block that is not returned in a BlockResponse.

Ω
BlockTransactionResponse†
ù∫transaction object˙5
3
transaction$"
 #/components/schemas/TransactioníKA BlockTransactionResponse contains information about a block transaction.

ı
MempoolRequest‚
ﬂ∫network_identifier object˙B
@
network_identifier*(
&#/components/schemas/NetworkIdentifieríyA MempoolRequest is utilized to retrieve all transaction identifiers in
the mempool for a particular network_identifier.

Ö
MempoolResponseÒ
Ó∫transaction_identifiers object˙Z
X
transaction_identifiers=
; arrayÚ0
.,
*#/components/schemas/TransactionIdentifieríkA MempoolResponse contains all transaction identifiers in the mempool
for a particular network_identifier.

ø
MempoolTransactionRequest°
û∫network_identifier∫transaction_identifier object˙å
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
H
transaction_identifier.,
*#/components/schemas/TransactionIdentifieríTA MempoolTransactionRequest is utilized to retrieve a transaction
from the mempool.

Á
MempoolTransactionResponse»
≈∫transaction object˙|
3
transaction$"
 #/components/schemas/Transaction
E
metadata9
7:,*descendant_fees: 123923
ancestor_count: 2
 objectí´A MempoolTransactionResponse contains an estimate of a mempool
transaction. It may not be possible to know the full impact of
a transaction in the mempool (ex: fee paid).

ö
MetadataRequestÜ
É object˙

metadata
	 objectí[A MetadataRequest is utilized in any request where
the only argument is optional metadata.

Ò
NetworkListResponseŸ
÷∫network_identifiers object˙R
P
network_identifiers9
7 arrayÚ,
*(
&#/components/schemas/NetworkIdentifierí_A NetworkListResponse contains all NetworkIdentifiers
that the node can serve information for.

ı
NetworkRequest‚
ﬂ∫network_identifier object˙[
@
network_identifier*(
&#/components/schemas/NetworkIdentifier

metadata
	 objectí`A NetworkRequest is utilized to retrieve some data specific exclusively
to a NetworkIdentifier.

Á
NetworkStatusResponseÕ
 ∫current_block_identifier∫current_block_timestamp∫genesis_block_identifier∫peers object˙Ç
D
current_block_identifier(&
$#/components/schemas/BlockIdentifier
=
current_block_timestamp" 
#/components/schemas/Timestamp
D
genesis_block_identifier(&
$#/components/schemas/BlockIdentifier
5
peers,
* arrayÚ

#/components/schemas/Peerí`NetworkStatusResponse contains basic information about the node's
view of a blockchain network.

§
NetworkOptionsResponseâ
Ü∫version∫allow object˙V
+
version 
#/components/schemas/Version
'
allow
#/components/schemas/AllowíéNetworkOptionsResponse contains information about the versioning of the
node and the allowed operation statuses, operation types, and errors.

ä
ConstructionMetadataRequestÍ
Á∫network_identifier∫options object˙”
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
é
optionsÇ
ˇ objectíÚSome blockchains require different metadata for different types of
transaction construction (ex: delegation versus a transfer). Instead
of requiring a blockchain node to return all possible types of
metadata for construction (which may require multiple node fetches),
the client can populate an options object to limit the metadata
returned to only the subset required.
í‰A ConstructionMetadataRequest is utilized to get information required
to construct a transaction. The Options object used to specify which
metadata to return is left purposely unstructured to allow flexibility
for implementers.

í
ConstructionMetadataResponseÒ
Ó∫metadata object˙p
n
metadatab
`:USaccount_sequence: 23
recent_block_hash: 0x52bc44d5378309ee2abf1539bf71de1b7d7be3b5
 objectí„The ConstructionMetadataResponse returns network-specific metadata
used for transaction construction. It is likely that the client will
not inspect this metadata before passing it to a client SDK that uses
it for construction.

Å
ConstructionSubmitRequest„
‡∫network_identifier∫signed_transaction object˙e
@
network_identifier*(
&#/components/schemas/NetworkIdentifier
!
signed_transaction
	 stringíBThe transaction submission request includes a signed transaction.

¨
ConstructionSubmitResponseç
ä∫transaction_identifier object˙c
H
transaction_identifier.,
*#/components/schemas/TransactionIdentifier

metadata
	 objectíA TransactionSubmitResponse contains the transaction_identifier of a
submitted transaction that was accepted into the mempool.
