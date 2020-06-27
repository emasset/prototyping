
3.0.0Ş
harmony API.Vthe purpose of this application is to provide all APIs needed
to interact with harmony"<
John Whittonhttp://johnwhitton.devjohn@johnwhitton.com*1
MIT License"http://opensource.org/licenses/MIT20.0.1A
https://api.s0.b.hmny.io/$harmony testnet hosted explorer node"»
Ø
/#net_versionÆ2Ã
v1-protocolrequest the network version.:
Š
request the network version.h
f
application/jsonR
#!
#components/schemas/net_version+)jsonrpc: "2.0"
id: 1
method: net_version
B…‚
200{
y
network version.e
c
application/jsonO
(&
$#components/schemas/net_version_resp#!jsonrpc: "2.0"
id: 1
result: "1"

İ
/#net_peerCountÉ2Æ
v1-protocolrequest the number of peers.:‰
†
the number of peers.l
j
application/jsonV
%#
!#components/schemas/net_peerCount-+jsonrpc: "2.0"
id: 1
method: net_peerCount
BŒ‰
200

network peer count.h
f
application/jsonR
(&
$#components/schemas/net_version_resp&$jsonrpc: "2.0"
id: 1
result: "0x17"
*¥
¢
f
request[
YºjsonrpcºidÊobjectú>
!
jsonrpc
Â"2.0"
Êstring

id
Â1
Êinteger
h
response\
ZºjsonrpcºidÊobjectú?
"
jsronrpc
Â"2.0"
Êstring

id
Â1
Êinteger
v
net_versiong
eÒ 
#/components/schemas/requestÒ?
=ºmethodÊobjectú(
&
method
Ânet_version
Êstring
k
net_version_respW
UÒ!
#/components/schemas/responseÒ.
,ºmethodÊobjectú

result
	Êstring
z
net_peerCounti
gÒ 
#/components/schemas/requestÒA
?ºmethodÊobjectú*
(
method
Ânet_peerCount
Êstring
m
net_peerCount_respW
UÒ!
#/components/schemas/responseÒ.
,ºmethodÊobjectú

result
	Êstring:+
v1-protocolprotocol APIs returning hex.:%
v1-blockblock APIs returning hex.:.
v2-protocolprotocol API returning decimal.:)
v2-blockblock APIs returning decimal.