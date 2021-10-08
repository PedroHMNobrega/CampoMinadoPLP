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
<p>
  <img  width="250em" src = "https://github.com/Leonardosu/CampoMinadoPLP/blob/master/Haskell/ex.png">
  <img  width="250em" src = "https://github.com/Leonardosu/CampoMinadoPLP/blob/master/Haskell/win.png">
  <img  width="250em" src = "https://github.com/Leonardosu/CampoMinadoPLP/blob/master/Haskell/lose.png">
</p>

##  Pré-requisito

* [stack](https://docs.haskellstack.org/en/stable/README/)

##  Instalar

Após instalar o stack, entrar no diretório haskel e executar os comandos:
```
stack install
stack build
```

## Inicializando o jogo

```
stack run
```
Abra o navegador em :
```
localhost:8023
```
Para revelar um quadrado, clique em cima dele e aperte uma tecla do teclado.</br>
Para adicionar uma bandeira, clique em cima do quadrado, depois pressione a tecla ```F```

##  Funcionalidades

* Criar o campo inicial após o primeiro espaço ser selecionado pelo usuário, posicionando as minas aleatoriamente no campo em posições diferentes da inicial.

* Preencher os espaços revelados com os números que indicam a quantidade de minas ao seu redor.

* O usuário pode usar bandeiras para marcar espaços não revelados onde provavelmente está uma mina.

* Existem 3 dificuldades, aumentando o tamanho do campo e a quantidade de minas conforme a dificuldade sobe.

* Determinar o fim do jogo como uma vitória, caso todos as posições vazias sejam reveladas, ou como uma derrota, caso um espaço com uma mina seja selecionado.

##  Equipe
<p>
<a href="https://github.com/PedroHMNobrega">
<img height="80em" width="80em" src="https://avatars.githubusercontent.com/u/54116203?v=4"/>  
  <em>Pedro Nóbrega</em>
</p>
  
<p>
<a href="https://github.com/Leonardosu">
<img height="80em" width="80em" src="https://avatars.githubusercontent.com/u/21243154?v=4" alt>
    <em>Leonardo Su</em>
</p>
    
<p>
<a href="https://github.com/IgorSerodio">
<img height="80em" width="80em" src="https://avatars.githubusercontent.com/u/79673301?v=4"/>  
  <em>Igor Seródio</em>
</p>
      
<p>
<a href="https://github.com/marcelodelazari">
<img height="80em" width="80em" src="https://avatars.githubusercontent.com/u/54554621?v=4"/>  
  <em>Marcelo Delazari</em>
</p>
        
<p>
  <a href="https://github.com/HenriqueGalindo">
  <img height="80em" width="80em" src="https://avatars.githubusercontent.com/u/55746037?v=4"/>  
  <em>Henrique Galindo</em>
</p>
