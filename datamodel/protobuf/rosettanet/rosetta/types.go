// GENERATED FILE: DO NOT EDIT!

package rosetta

// Types used by the API.
//
type NetworkIdentifier struct {
	Blockchain           string
	Network              string
	SubNetworkIdentifier *SubNetworkIdentifier
}

//
type Metadata map[string]interface{}

//
type SubNetworkIdentifier struct {
	Network  string
	Metadata *Metadata
}

//
type BlockIdentifier struct {
	Index int64
	Hash  string
}

//
type PartialBlockIdentifier struct {
	Index int64
	Hash  string
}

//
type TransactionIdentifier struct {
	Hash string
}

//
type OperationIdentifier struct {
	Index        int64
	NetworkIndex int64
}

//
type AccountIdentifier struct {
	Address    string
	SubAccount *SubAccountIdentifier
	Metadata   *Metadata
}

//
type SubAccountIdentifier struct {
	Address  string
	Metadata *Metadata
}

//
type Block struct {
	BlockIdentifier       *BlockIdentifier
	ParentBlockIdentifier *BlockIdentifier
	Timestamp             *Timestamp
	Transactions          []Transaction
	Metadata              *Metadata
}

//
type Transaction struct {
	TransactionIdentifier *TransactionIdentifier
	Operations            []Operation
	Metadata              *Metadata
}

//
type Operation struct {
	OperationIdentifier *OperationIdentifier
	RelatedOperations   []OperationIdentifier
	Type                string
	Status              string
	Account             *AccountIdentifier
	Amount              *Amount
	Metadata            *Metadata
}

//
type Amount struct {
	Value    string
	Currency *Currency
	Metadata *Metadata
}

//
type Currency struct {
	Symbol   string
	Decimals int32
	Metadata *Metadata
}

//
type Peer struct {
	PeerId   string
	Metadata *Metadata
}

//
type Version struct {
	RosettaVersion    string
	NodeVersion       string
	MiddlewareVersion string
	Metadata          *Metadata
}

//
type Allow struct {
	OperationStatuses []OperationStatus
	OperationTypes    []string
	Errors            []Error
}

//
type Error struct {
	Code      int32
	Message   string
	Retriable bool
}

//
type OperationStatus struct {
	Status     string
	Successful bool
}

//
type Timestamp struct {
	Value int64
}

//
type AccountBalanceRequest struct {
	NetworkIdentifier *NetworkIdentifier
	AccountIdentifier *AccountIdentifier
	BlockIdentifier   *PartialBlockIdentifier
}

//
type AccountBalanceResponse struct {
	BlockIdentifier *BlockIdentifier
	Balances        []Amount
	Metadata        *Metadata
}

//
type BlockRequest struct {
	NetworkIdentifier *NetworkIdentifier
	BlockIdentifier   *PartialBlockIdentifier
}

//
type BlockResponse struct {
	Block             *Block
	OtherTransactions []TransactionIdentifier
}

//
type BlockTransactionRequest struct {
	NetworkIdentifier     *NetworkIdentifier
	BlockIdentifier       *BlockIdentifier
	TransactionIdentifier *TransactionIdentifier
}

//
type BlockTransactionResponse struct {
	Transaction *Transaction
}

//
type MempoolRequest struct {
	NetworkIdentifier *NetworkIdentifier
}

//
type MempoolResponse struct {
	TransactionIdentifiers []TransactionIdentifier
}

//
type MempoolTransactionRequest struct {
	NetworkIdentifier     *NetworkIdentifier
	TransactionIdentifier *TransactionIdentifier
}

//
type MempoolTransactionResponse struct {
	Transaction *Transaction
	Metadata    *Metadata
}

//
type MetadataRequest struct {
	Metadata *Metadata
}

//
type NetworkListResponse struct {
	NetworkIdentifiers []NetworkIdentifier
}

//
type NetworkRequest struct {
	NetworkIdentifier *NetworkIdentifier
	Metadata          *Metadata
}

//
type NetworkStatusResponse struct {
	CurrentBlockIdentifier *BlockIdentifier
	CurrentBlockTimestamp  *Timestamp
	GenesisBlockIdentifier *BlockIdentifier
	Peers                  []Peer
}

//
type NetworkOptionsResponse struct {
	Version *Version
	Allow   *Allow
}

//
type Options map[string]interface{}

//
type ConstructionMetadataRequest struct {
	NetworkIdentifier *NetworkIdentifier
	Options           *Options
}

//
type ConstructionMetadataResponse struct {
	Metadata *Metadata
}

//
type ConstructionSubmitRequest struct {
	NetworkIdentifier *NetworkIdentifier
	SignedTransaction string
}

//
type ConstructionSubmitResponse struct {
	TransactionIdentifier *TransactionIdentifier
	Metadata              *Metadata
}

// NetworkListParameters holds parameters to NetworkList
type NetworkListParameters struct {
	MetadataRequest *MetadataRequest
}

// NetworkStatusParameters holds parameters to NetworkStatus
type NetworkStatusParameters struct {
	NetworkRequest *NetworkRequest
}

// NetworkOptionsParameters holds parameters to NetworkOptions
type NetworkOptionsParameters struct {
	NetworkRequest *NetworkRequest
}

// BlockParameters holds parameters to Block
type BlockParameters struct {
	BlockRequest *BlockRequest
}

// BlockTransactionParameters holds parameters to BlockTransaction
type BlockTransactionParameters struct {
	BlockTransactionRequest *BlockTransactionRequest
}

// MempoolParameters holds parameters to Mempool
type MempoolParameters struct {
	MempoolRequest *MempoolRequest
}

// MempoolTransactionParameters holds parameters to MempoolTransaction
type MempoolTransactionParameters struct {
	MempoolTransactionRequest *MempoolTransactionRequest
}

// AccountBalanceParameters holds parameters to AccountBalance
type AccountBalanceParameters struct {
	AccountBalanceRequest *AccountBalanceRequest
}

// ConstructionMetadataParameters holds parameters to ConstructionMetadata
type ConstructionMetadataParameters struct {
	ConstructionMetadataRequest *ConstructionMetadataRequest
}

// ConstructionSubmitParameters holds parameters to ConstructionSubmit
type ConstructionSubmitParameters struct {
	ConstructionSubmitRequest *ConstructionSubmitRequest
}
