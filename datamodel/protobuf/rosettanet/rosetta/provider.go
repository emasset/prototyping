// GENERATED FILE: DO NOT EDIT!

package rosetta

// To create a server, first write a class that implements this interface.
// Then pass an instance of it to Initialize().
type Provider interface {

	// This endpoint returns a list of NetworkIdentifiers that the Rosetta
	// server can handle.
	//
	NetworkList(parameters *NetworkListParameters, responses *NetworkListResponse) (err error)

	// This endpoint returns the current status of the network requested. Any
	// NetworkIdentifier returned by /network/list should be accessible here.
	//
	NetworkStatus(parameters *NetworkStatusParameters, responses *NetworkStatusResponse) (err error)

	// This endpoint returns the version information and allowed
	// network-specific types for a NetworkIdentifier. Any
	// NetworkIdentifier returned by /network/list should be accessible here.
	//
	// Because options are retrievable in the context of a NetworkIdentifier,
	// it is possible to define unique options for each network.
	//
	NetworkOptions(parameters *NetworkOptionsParameters, responses *NetworkOptionsResponse) (err error)

	// Get a block by its Block Identifier. If transactions are returned in
	// the same call to the node as fetching the block, the response should
	// include these transactions in the Block object. If not, an array of
	// Transaction Identifiers should be returned so /block/transaction
	// fetches can be done to get all transaction information.
	//
	Block(parameters *BlockParameters, responses *BlockResponse) (err error)

	// Get a transaction in a block by its Transaction Identifier. This endpoint
	// should only be used when querying a node for a block does not return all
	// transactions contained within it.
	//
	// All transactions returned by this endpoint must be appended to any
	// transactions returned by the /block method by consumers of this data.
	// Fetching a transaction by hash is considered an Explorer Method
	// (which is classified under the Future Work section).
	//
	// Calling this endpoint requires reference to a BlockIdentifier because
	// transaction parsing can change depending on which block contains the
	// transaction. For example, in Bitcoin it is necessary to know which block
	// contains a transaction to determine the destination of fee payments.
	// Without specifying a block identifier, the node
	// would have to infer which block to use (which could change during a re-org).
	//
	// Implementations that require fetching previous transactions to populate
	// the response (ex: Previous UTXOs in Bitcoin) may find it useful to run a
	// cache within the Rosetta server in the /data directory
	// (on a path that does not conflict with the node).
	//
	BlockTransaction(parameters *BlockTransactionParameters, responses *BlockTransactionResponse) (err error)

	// Get all Transaction Identifiers in the mempool
	Mempool(parameters *MempoolParameters, responses *MempoolResponse) (err error)

	// Get a transaction in the mempool by its Transaction Identifier. This is
	// a separate request than fetching a block transaction (/block/transaction)
	// because some blockchain nodes need to know that a transaction query is
	// for something in the mempool instead of a transaction in a block.
	//
	// Transactions may not be fully parsable until they are in a block (ex: may
	// not be possible to determine the fee to pay before a transaction is
	// executed). On this endpoint, it is ok that returned transactions are
	// only estimates of what may actually be included in a block.
	//
	MempoolTransaction(parameters *MempoolTransactionParameters, responses *MempoolTransactionResponse) (err error)

	// Get an array of all Account Balances for an Account Identifier and the
	// Block Identifier at which the balance lookup was performed.
	//
	// Some consumers of account balance data need to know at which block the
	// balance was calculated to reconcile account balance changes.
	//
	// To get all balances associated with an account, it may be necessary to
	// perform multiple balance requests with unique Account Identifiers.
	//
	// If the client supports it, passing nil AccountIdentifier metadata to
	// the request should fetch all balances (if applicable).
	//
	// It is also possible to perform a historical balance lookup (if the server
	// supports it) by passing in an optional BlockIdentifier.
	//
	AccountBalance(parameters *AccountBalanceParameters, responses *AccountBalanceResponse) (err error)

	// Get any information required to construct a transaction for a specific
	// network. Metadata returned here could be a recent hash to use, an
	// account sequence number, or even arbitrary chain state. It is up to the
	// client to correctly populate the options object with any
	// network-specific details to ensure the correct metadata is retrieved.
	//
	// It is important to clarify that this endpoint should not pre-construct
	// any transactions for the client (this should happen in the SDK). This
	// endpoint is left purposely unstructured because of the wide scope
	// of metadata that could be required.
	//
	// In a future version of the spec, we plan to pass an array of Rosetta
	// Operations to specify which metadata should be received and to create
	// a transaction in an accompanying SDK. This will help to insulate the
	// client from chain-specific details that are currently required here.
	//
	ConstructionMetadata(parameters *ConstructionMetadataParameters, responses *ConstructionMetadataResponse) (err error)

	// Submit a pre-signed transaction to the node. This call should not block
	// on the transaction being included in a block. Rather, it should return
	// immediately with an indication of whether or not the transaction was
	// included in the mempool.
	//
	// The transaction submission response should only return a 200 status
	// if the submitted transaction could be included in the mempool.
	// Otherwise, it should return an error.
	//
	ConstructionSubmit(parameters *ConstructionSubmitParameters, responses *ConstructionSubmitResponse) (err error)
}
