
3.0.0�
harmony API.Vthe purpose of this application is to provide all APIs needed
to interact with harmony"<
John Whittonhttp://johnwhitton.devjohn@johnwhitton.com*1
MIT License"http://opensource.org/licenses/MIT20.0.1A
https://api.s0.b.hmny.io/$harmony testnet hosted explorer node"�
�
/#net_version�2�
v1-protocolrequest the network version.:�
�
request the network version.h
f
application/jsonR
#!
#components/schemas/net_version+)jsonrpc: "2.0"
id: 1
method: net_version
B��
200{
y
network version.e
c
application/jsonO
(&
$#components/schemas/net_version_resp#!jsonrpc: "2.0"
id: 1
result: "1"

�
/#net_peerCount�2�
v1-protocolrequest the number of peers.:�
�
the number of peers.l
j
application/jsonV
%#
!#components/schemas/net_peerCount-+jsonrpc: "2.0"
id: 1
method: net_peerCount
B��
200�

network peer count.h
f
application/jsonR
(&
$#components/schemas/net_version_resp&$jsonrpc: "2.0"
id: 1
result: "0x17"
*�
�
f
request[
Y�jsonrpc�id�object�>
!
jsonrpc
�"2.0"
�string

id
�1
�integer
h
response\
Z�jsonrpc�id�object�?
"
jsronrpc
�"2.0"
�string

id
�1
�integer
v
net_versiong
e� 
#/components/schemas/request�?
=�method�object�(
&
method
�net_version
�string
k
net_version_respW
U�!
#/components/schemas/response�.
,�method�object�

result
	�string
z
net_peerCounti
g� 
#/components/schemas/request�A
?�method�object�*
(
method
�net_peerCount
�string
m
net_peerCount_respW
U�!
#/components/schemas/response�.
,�method�object�

result
	�string:+
v1-protocolprotocol APIs returning hex.:%
v1-blockblock APIs returning hex.:.
v2-protocolprotocol API returning decimal.:)
v2-blockblock APIs returning decimal.