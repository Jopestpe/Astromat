# Bibliotecas
import os
import sys
import glob
from pathlib import Path
# Intalar Bibliotecas
os.system('export PATH="/home/$USER/.local/bin:$PATH"')
os.system("pip install nanoemoji")
os.system("pip install picosvg")
# Variaveis
nome_do_projeto = "AstromatEmoji"
caminho = "AstromatEmojisSvgs/*.svg"
tipo_cor = "glyf_colr_0"
altura = 1024
unidades = 1024
translate_transform = "translate(0, 0)" 
familia_da_fonte = nome_do_projeto
nome_do_arquivo_ttf = nome_do_projeto
largura = 512
# Funcao
def SVGparaTTF():
    # Se nao ouver uma pasta para o projeto
    if not os.path.isdir(nome_do_projeto):
        # Cria uma pasta projeto
        os.mkdir(nome_do_projeto)
        # Cria uma subpasta para picosvg
        os.mkdir(nome_do_projeto + "/picosvg")
    # Coleta todos os svg pasta transforma-os em picosvgs e os coloca na subpasta picosvg
    for caminho_ate_svg in glob.glob(caminho):
        # Pega nome do svg
        nome = Path(caminho_ate_svg).stem
        # Simplifica o svg com picosvg
        picosvg = os.popen('! picosvg ' + str(caminho_ate_svg)).read()
        # Cria svg novos e os coloca na pasta picosvg do projeto
        with open(nome_do_projeto + "/picosvg/" + str(nome) + '.svg','w') as novo_svg:
            for Linhas in picosvg:
                novo_svg.write(str(Linhas))
    # Escreve o comando
    cmd_nanoemoji = "nanoemoji --exec_ninja " + str(nome_do_projeto)+ "/picosvg/*.svg" + \
                    " --family=" + str(nome_do_projeto) + \
                    " --upem=" + str(unidades) + \
                    " --transform='" + str(translate_transform) + \
                    "' --ascender=" + str(altura) + \
                    " --color_format=" + str(tipo_cor) + \
                    " --build_dir=" + str(nome_do_projeto) + "/construir/" + \
                    " --output_file=" + str(nome_do_projeto) + ".ttf" + \
                    " --width=" + str(largura) 
    # Executa o comando
    os.popen(cmd_nanoemoji).read()
# Executa
SVGparaTTF()