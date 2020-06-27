// GENERATED FILE: DO NOT EDIT!

package rosetta

import (
	"encoding/json"
	"errors"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
)

func intValue(s string) (v int64) {
	v, _ = strconv.ParseInt(s, 10, 64)
	return v
}

// This package-global variable holds the user-written Provider for API services.
// See the Provider interface for details.
var provider Provider

// These handlers serve API methods.

// Handler
// This endpoint returns a list of NetworkIdentifiers that the Rosetta
// server can handle.
//
func HandleNetworkList(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &NetworkListParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.MetadataRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	networklistresponse := &NetworkListResponse{}
	// call the service provider
	err = provider.NetworkList(parameters, networklistresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(networklistresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
// This endpoint returns the current status of the network requested. Any
// NetworkIdentifier returned by /network/list should be accessible here.
//
func HandleNetworkStatus(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &NetworkStatusParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.NetworkRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	networkstatusresponse := &NetworkStatusResponse{}
	// call the service provider
	err = provider.NetworkStatus(parameters, networkstatusresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(networkstatusresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
// This endpoint returns the version information and allowed
// network-specific types for a NetworkIdentifier. Any
// NetworkIdentifier returned by /network/list should be accessible here.
//
// Because options are retrievable in the context of a NetworkIdentifier,
// it is possible to define unique options for each network.
//
func HandleNetworkOptions(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &NetworkOptionsParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.NetworkRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	networkoptionsresponse := &NetworkOptionsResponse{}
	// call the service provider
	err = provider.NetworkOptions(parameters, networkoptionsresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(networkoptionsresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
// Get a block by its Block Identifier. If transactions are returned in
// the same call to the node as fetching the block, the response should
// include these transactions in the Block object. If not, an array of
// Transaction Identifiers should be returned so /block/transaction
// fetches can be done to get all transaction information.
//
func HandleBlock(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &BlockParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.BlockRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	blockresponse := &BlockResponse{}
	// call the service provider
	err = provider.Block(parameters, blockresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(blockresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
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
func HandleBlockTransaction(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &BlockTransactionParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.BlockTransactionRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	blocktransactionresponse := &BlockTransactionResponse{}
	// call the service provider
	err = provider.BlockTransaction(parameters, blocktransactionresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(blocktransactionresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
// Get all Transaction Identifiers in the mempool
func HandleMempool(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &MempoolParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.MempoolRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	mempoolresponse := &MempoolResponse{}
	// call the service provider
	err = provider.Mempool(parameters, mempoolresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(mempoolresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
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
func HandleMempoolTransaction(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &MempoolTransactionParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.MempoolTransactionRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	mempooltransactionresponse := &MempoolTransactionResponse{}
	// call the service provider
	err = provider.MempoolTransaction(parameters, mempooltransactionresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(mempooltransactionresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
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
func HandleAccountBalance(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &AccountBalanceParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.AccountBalanceRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	accountbalanceresponse := &AccountBalanceResponse{}
	// call the service provider
	err = provider.AccountBalance(parameters, accountbalanceresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(accountbalanceresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
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
func HandleConstructionMetadata(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &ConstructionMetadataParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.ConstructionMetadataRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	constructionmetadataresponse := &ConstructionMetadataResponse{}
	// call the service provider
	err = provider.ConstructionMetadata(parameters, constructionmetadataresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(constructionmetadataresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Handler
// Submit a pre-signed transaction to the node. This call should not block
// on the transaction being included in a block. Rather, it should return
// immediately with an indication of whether or not the transaction was
// included in the mempool.
//
// The transaction submission response should only return a 200 status
// if the submitted transaction could be included in the mempool.
// Otherwise, it should return an error.
//
func HandleConstructionSubmit(w http.ResponseWriter, r *http.Request) {
	var err error
	// instantiate the parameters structure
	parameters := &ConstructionSubmitParameters{}
	// deserialize request from post data
	decoder := json.NewDecoder(r.Body)
	err = decoder.Decode(&parameters.ConstructionSubmitRequest)
	if err != nil {
		w.WriteHeader(http.StatusBadRequest)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
	// get request fields in path and query parameters
	// instantiate the response structure
	constructionsubmitresponse := &ConstructionSubmitResponse{}
	// call the service provider
	err = provider.ConstructionSubmit(parameters, constructionsubmitresponse)
	if err == nil {
		// write the normal response
		encoder := json.NewEncoder(w)
		encoder.Encode(constructionsubmitresponse)
		return
	} else {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error() + "\n"))
		return
	}
}

// Initialize the API service.
func Initialize(p Provider) {
	provider = p
	var router = mux.NewRouter()
	router.HandleFunc("/network/list", HandleNetworkList).Methods("POST")
	router.HandleFunc("/network/status", HandleNetworkStatus).Methods("POST")
	router.HandleFunc("/network/options", HandleNetworkOptions).Methods("POST")
	router.HandleFunc("/block", HandleBlock).Methods("POST")
	router.HandleFunc("/block/transaction", HandleBlockTransaction).Methods("POST")
	router.HandleFunc("/mempool", HandleMempool).Methods("POST")
	router.HandleFunc("/mempool/transaction", HandleMempoolTransaction).Methods("POST")
	router.HandleFunc("/account/balance", HandleAccountBalance).Methods("POST")
	router.HandleFunc("/construction/metadata", HandleConstructionMetadata).Methods("POST")
	router.HandleFunc("/construction/submit", HandleConstructionSubmit).Methods("POST")
	http.Handle("/", router)
}

// Provide the API service over HTTP.
func ServeHTTP(address string) error {
	if provider == nil {
		return errors.New("Use rosetta.Initialize() to set a service provider.")
	}
	return http.ListenAndServe(address, nil)
}
