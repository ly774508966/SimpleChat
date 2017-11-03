echo off
echo .protoc ���� .cs

protoc --csharp_out=./ MsgProto.proto

echo .cs  ���� .dll
csc /target:library /reference:Google.Protobuf.dll /out:ProtoData.dll MsgProto.cs 

GenerateMsgTypeTypeMap
csc /target:library /reference:Google.Protobuf.dll /out:ProtoData.dll *.cs 



echo copy ProtoData.dll to client
xcopy ProtoData.dll ..\SimpleChat\SimpleChat\Assets\Plugins /y/d/q

echo copy ProtoData.dll to server
xcopy ProtoData.dll ..\SimpleChatServer\SimpleChatServer\Reference /y/d/q

pause