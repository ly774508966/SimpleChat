echo off
echo .protoc ���� .cs

rmdir tmp /s/q
mkdir tmp

::�����ļ�����.cs�ļ�
protoc --csharp_out=./ MsgProto.proto


::����dll�ļ�
echo .cs  ���� .dll
csc /target:library /reference:Google.Protobuf.dll /out:ProtoData.dll MsgProto.cs 


::����ProtoData.dll����MsgTypeTypeMap.cs�ļ�
GenerateMsgTypeTypeMap
::cs�ļ�����dll�ļ�
csc /target:library /reference:Google.Protobuf.dll /out:ProtoData.dll *.cs 


::�������ɵ��ļ����ͻ��˷�����Ŀ¼
echo copy ProtoData.dll to client
xcopy ProtoData.dll ..\SimpleChat\Assets\Plugins /y/d/q
echo copy ProtoData.dll to server
xcopy ProtoData.dll ..\SimpleChatServer\SimpleChatServer\Reference /y/d/q


::�ƶ����ɵ��ļ���tmpĿ¼��tmpĿ¼����Ҫ�ŵ�git��
move /y *.cs tmp
move /y ProtoData.dll tmp

pause