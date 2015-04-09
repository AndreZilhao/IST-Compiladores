# Compiladores-IST
Projectos de Compiladores

## Parte 1
### Implementação de um analisador léxico para a linguagem Mini-Java+

O objectivo é utilizar a ferramenta flex para reconhecer os tokens do
linguagem MiniJava+. A análise léxica deverá também reportar quaisquer tokens
inválidos no ficheiro de entrada.

Link para o projecto Mini-Java: http://www.cambridge.org/us/features/052182060X/mjreference/mjreference.html

## Descrição da Linguagem
A linguagem de programação MiniJava+ é baseada na linguagem MiniJava. A extensão proposta permite a leitura de valores inteiros, aumentando assim a versatilidade do compilador a ser realizado. A linguagem MiniJava
é um subconjunto da linguagem de programação Java. Assim, o significado de
qualquer programa em MiniJava corresponde ao significado do programa em Java. O
mesmo aplica-se a programas na linguagem MiniJava+.

## Sobre a Análise Léxica

Sobre a Análise Léxica
Os programas em MiniJava+ devem utilizar o código ASCII.  
• Identificadores: Um identificador é uma sequência de letras, digitos, e underscores, que começa com
uma letra. Letras maiusculas diferem das minusculas. Na definição da sintaxe, id
denota um identificador.  
• Inteiros: Uma sequência de digitos é uma constante inteira e representa o valor inteiro associado.
Na definição da sintaxe, INTEGER LITERAL denota uma constante inteira.  
• Operadores binários:  Um operador binário é um de: && < + - \*. Na definição de sintaxe, op denota um operador binário.  
• Comentários:  Um comentário pode aparecer entre quaisquer dois tokens da linguagem. Existem duas formas de comentários:  
– Uma forma de comentário começa em /\* e termina em */.  
– A outra forma de comentário começa em // e termina no fim da linha.  

## Parte 2
### Implementação de um analisador sintático para linguagem minijava+

O objectivo é implementar um analisador de sintaxe para fazer o reconhecimento gramatical correcto da linguagem. Para este fim foi usada a linguagem Bison. A analise léxica deverá ainda reportar quaisquer erros de sintaxe na consola, para além dos erros gramaticais da primeira parte da implementação.

## Sintaxe do Mini-Java+

A.2 Sintaxe do MiniJava+

######Program:        
→ MainClass ClassDecl ∗
  
######MainClass:  
→ class id { public static void main ( String [] id ) { Statement } }  
  
######ClassDecl:  
→ class id { VarDecl ∗ MethodDecl ∗ }  
→ class id extends id { VarDecl ∗ MethodDecl ∗ }  
  
######VarDecl:  
→ Type id ;  
  
######MethodDecl:   
→ public Type id ( FormalList ) 
{ VarDecl ∗ Statement ∗ return Exp ; }  
  
######FormalList:   
→ Type id FormalRest ∗  
→  
  
######FormalRest:   
→ , Type id  
  
######Type:   
→ int []  
→ boolean  
→ int  
→ id  
  
######Statement:   
→ { Statement ∗ }  
→ if ( Exp ) Statement else Statement  
→ while ( Exp ) Statement  
→ System . out . println ( Exp ) ;  
→ id = Exp ;  
→ id [ Exp ] = Exp ; 
  
######Exp:  
→ Exp op Exp  
→ Exp [ Exp ]  
→ Exp . length  
→ Exp . id ( ExpList )  
→ Readers . IntReader . readInt ( )  
→ INTEGER LITERAL  
→ true  
→ false  
→ id  
→ this  
→ new int [ Exp ]  
→ new id ( )  
→ ! Exp  
→ ( Exp )
  
######ExpList:  
→ Exp ExpRest ∗  
→  
  
######ExpRest:  
→ , Exp  

## Relatórios  

O relatório da primeira parte do projecto pode ser encontrado em:  
https://drive.google.com/open?id=0B8BT07stj_OxRFhYWmhGVnpweWM&authuser=0  

O relatório da segunda parte do projecto pode ser encontrado em:  
https://drive.google.com/open?id=0B8BT07stj_OxbXNUR2lQbDlxM0E&authuser=0  
