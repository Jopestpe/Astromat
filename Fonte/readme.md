# CoresTTF

## Crie True Type Font(.ttf) multicoloridas com SVG.

### Dependencias
* [nanoemoji](https://github.com/googlefonts/nanoemoji) 
* [picosvg](https://github.com/googlefonts/picosvg)

#### Estudo
* [color-fonts](https://github.com/googlefonts/color-fonts)

### Instalar dependencias
```bash
sudo apt install python3 python3-pip
pip3 install nanoemoji picosvg -y
```

### Sobre SVG 
* 128px x 128px 
* Certifique-se do vector do svg ser de preferencia shape unico Unir caso necessario. 

### Nomear caracteres  
* [Codigos dos caracteres](https://en.wikipedia.org/wiki/List_of_Unicode_characters#Basic_Latin) 
* Exemplo: U+0041(letra A), nomeio para u0041.svg 

### Nomear emoji  
* [Codigos dos emojis](https://unicode.org/emoji/charts/full-emoji-list.html) 
* Exemplo: U+270D(✍️) nomeio para emoji_u270d*.svg 
* O * faz com que seja usado em todas as variantes do emoji ✍️✍🏻✍🏼✍🏽✍🏾✍🏿

### Variantes de emoji
* Exemplo: para nomear um emoji é emoji_u1f1e7.svg(🇧)
* Exemplo: para (🇧🇷) U+1F1E7(🇧) U+1F1F7(🇷) fica emoji_u1f1e7_1f1f7.svg 

### Rodar
* Insira o nome do projeto
* Coloque seus SVGs na pasta 'svg' 
```bash
sudo python3 main.py
```

### Adicionar argumentos linha de comando
```python
for a in sys.argv:
    print('agr: ', a, '/n')
    # n= u= t= a= c= f= d=
```

🟰🎚️ℹ️▶️🔁⚙️🌐