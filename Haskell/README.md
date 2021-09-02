# Campo Minado

<p>
  <a href="#proposta">Proposta</a>&nbsp;&nbsp;&nbsp;
  <a href="#imagens">Imagens</a>&nbsp;&nbsp;&nbsp;
  <a href="#pré-requisito">Pré-requisito</a>&nbsp;&nbsp;&nbsp;
  <a href="#inicializando-o-jogo">Inicializando o jogo</a>&nbsp;&nbsp;&nbsp;
  <a href="#funcionalidades">Funcionalidades</a>&nbsp;&nbsp;&nbsp;
  <a href="#equipe">Equipe</a>&nbsp;&nbsp;&nbsp;
</p>

## Proposta
O projeto consiste em implementar o jogo [Campo Minado](https://pt.wikipedia.org/wiki/Campo_minado) em Haskell.

## Imagens
exemplo de foto


##  Pré-requisito

* ghc ver.7.6.3 
* cabal 1.18.0.2

* System.Random 
    ```
    cabal install random
    ```
* Graphics.UI.Threepenny
    ```
    cabal install threepenny-gui -fbuildExamples
    ```
## Inicializando o jogo

```
ghc --make Main.hs
```
Abra o navegador em :
```
localhost:8023
```


##  Funcionalidades

* Criar o campo inicial após o primeiro espaço ser selecionado pelo usuário, posicionando as minas aleatoriamente no campo em posições diferentes da inicial.

* Preencher os espaços revelados com os números que indicam a quantidade de minas ao seu redor.

* O usuário pode usar bandeiras para marcar espaços não revelados onde provavelmente está uma mina.

* Existem 3 dificuldades, aumentando o tamanho do campo e a quantidade de minas conforme a dificuldade sobe.

* Determinar o fim do jogo como uma vitória, caso todos as posições vazias sejam reveladas, ou como uma derrota, caso um espaço com uma mina seja selecionado.

##  Equipe
<style> 
    figure { 
        float:left; 
        margin:10px; 
    } 
</style> 

<figure>
<a href="https://github.com/Leonardosu">
<img height="100em" width="100em" src="https://avatars.githubusercontent.com/u/21243154?v=4"s/>
<figcaption>Leonardo Su</figcaption>
</figure>

<figure>
<a href="https://github.com/PedroHMNobrega">
<img height="100em" width="100em" src="https://avatars.githubusercontent.com/u/54116203?v=4"/>  
<figcaption>Pedro Nóbrega</figcaption>
</figure>

<figure>
<a href="https://github.com/IgorSerodio">
<img height="100em" width="100em" src="https://avatars.githubusercontent.com/u/79673301?v=4"/>  
<figcaption>Igor Seródio</figcaption>
</figure>

<figure>
<a href="https://github.com/marcelodelazari">
<img height="100em" width="100em" src="https://avatars.githubusercontent.com/u/54554621?v=4"/>  
<figcaption>Marcelo Delazari</figcaption>
</figure>

<figure>
<a href="https://github.com/">
<img height="100em" width="100em" src=""/>  
<figcaption>Henrique Galindo</figcaption>
</figure>
