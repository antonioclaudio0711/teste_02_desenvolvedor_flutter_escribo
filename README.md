Teste técnico 02 para desenvolvedor de software (Dart) - Escribo

Para executar o projeto em questão deve-se inicialmente realizar a instalação de alguns programas em seu dispositivo local, sendo estes:

1. GIT (https://git-scm.com/downloads): necessário para a clonagem do projeto;
2. Visual Studio Code (https://code.visualstudio.com/download): IDE necessária para inicializar o projeto;
3. Android Studio (https://developer.android.com/studio/install?hl=pt-br): necessário para a criação de emuladores Android;

Após realizar o download dos programas acima, siga os passos destacados a seguir para inicializar o projeto:

1. Na página do repositório no GitHub, vá até a opção "Code" e copie o link "HTTPS" disponibilizado;
2. Na pasta em que o projeto será depositado, abra o terminal do GIT e digite: "git clone" seguido do link copiado;
3. Após a clonagem do projeto abra-o no Visual Studio Code;
4. Na página de extensões do Visual Studio Code, instale o plugin "Flutter";
5. Reinicie o Visual Studio Code para inicialização da extensão instalada;
6. Abra o Android Studio e crie um emulador Android para execução do projeto;
    More Actions ---> Virtual Device Manager ---> Create Device
7. Após seguir o caminho especificado no passo anterior, selecione as especificidades do emulador e crie-o;
8. Retornando ao Visual Studio Code, selecione o campo 'Devices' no canto inferior direito e escolha o emulador Android criado anteriormente;
9. Com a pasta do projeto aberta, utilize o atalho " Ctrl + Shift + ' " para abrir o console de depuração;
10. Vá até a aba "Terminal" e digite "flutter run";

OBSERVAÇÃO: 
 - Ao entrar no repositório de códigos presentes no GitHub, a aba lateral presente do lado direito possui uma sessão denominada "Releases". Vá até esta sessão e realize o download do arquivo 'app-arm64-v8a-release.apk' em um dispositivo móvel (preferencialmente com um sistema operacional Android). Este arquivo irá instalar o aplicativo no dispositivo móvel. 
