from krita import *
# Nome do projeto
nome_do_projeto = "svg"
# Salvar todas as camadas
programa = Krita.instance()
arquivoAtual = programa.activeDocument()
camadas = arquivoAtual.topLevelNodes()
# Cria uma pasta bin onde krita foi instalado(D:\Krita 5.1.1\bin).
if not os.path.isdir(nome_do_projeto):
        os.mkdir(nome_do_projeto)
# Todas as camadas
for camada in camadas:
    if camada.type() == "vectorlayer":
        nome_camada = camada.name()
        texto_svg = camada.toSvg()
        with open( str(nome_do_projeto) + "/" + str(nome_camada) + '.svg', 'w' ) as novo_svg:
            for linhas in texto_svg :
                novo_svg.write(str(linhas))