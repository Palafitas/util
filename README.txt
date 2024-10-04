+++ Sobre +++
Aqui é armazenado scripts úteis feitos em shell

+++ Youtube-dl +++
Eu recomendo antes de executar os comandos abaixo, criar uma pasta separada para salvar todos itens da playlist.

yt-dlp -i -f mp4 --yes-playlist 'https://www.youtube.com/watch?v=7Vy8970q0Xc&list=PLwJ2VKmefmxpUJEGB1ff6yUZ5Zd7Gegn2'
yt-dlp -i PLwJ2VKmefmxpUJEGB1ff6yUZ5Zd7Gegn2

+++ ffmpeg +++
Converter mp3 para opus:
ffmpeg -i entrada.mp3 -c:a libopus saida.opus

Converter mp4 para com VP9 webm/opus
ffmpeg -i entrada.mp4 -c:v libvpx-vp9 -b:v 2M -c:a libopus saida.webm

Sincronizar Audio com Vídeo quando audio sai antes
ffmpeg -i entrada.mp4 -async 1 -c:v copy -c:a copy saida.mp4

Sincronizar Audio com Vídeo quando video sai antes
ffmpeg -i entrada.mp4 -vsync 1 -c:v copy -c:a copy saida.mp4

Gravar tela toda
ffmpeg -video_size 1024x768 -framerate 60 -f x11grab -i :0.0 -f pulse -ac 2 -i default ~/destino/gravacao_$(date +"%d-%m-%Y_%H-%M-%S").mkv

Stream Tela
ffmpeg -s 1600x900 -f x11grab -i :0.0+0,0 -preset ultrafast -tune zero_latency -f mpegts -omit_video_pes_length 1 udp://$(hostname -I | xargs):PORTA &
ffplay -fflags nobuffer -flags low_delay -probesize 32 -analyzeduration 1 -strict experimental -framedrop -f mpegts -vf setpts=0 udp://$(hostname -I | xargs):PORTA

+++ remover_duplicado +++
Remove arquivos duplicados em um diretório com base no hash md5 dos mesmos.

chmod +x remover_duplicado.sh
./remover_duplicado ~/diretorio/excluir/duplicados

+++ renomear_massa +++
Renomeia arquivos em massa seguindo o nome do diretório pai, e.g: ~/videos/lala -> arquivos vão ser lala01, lala02, ...
Sim, é respeitada a extensão do arquivo

chmod +x renomear_massa.sh
./renomear_massa.sh ~/diretorio/renomear/em/massa

+++ juntar_audio_video +++
Juntar vários arquivos de audios para um arquivo ~/diretorio/contendo/audios/output.{extensao_arquivo}.
Se atentar que os arquivos precisam ter a mesma extensão.

chmod +x juntar_audio_video.sh
./juntar_audio_video ~/diretorio/contendo/audios

+++ ascii2html +++
Converter um desenho em ASCII para HTML (entre tag <a> com <br> para quebra de linha).

chmod +x ascii2html.sh
./ascii2html.sh ~/caminho/do/arquivo.txt >> ~/caminho/da/saida.html

+++ Verificar dois diretórios são iguais +++
tree >> dir
diff dir 1 dir 2

+++ Compactar com .tar.xz +++
tar -vcJf <archive.tar.xz> <files>

+++ Descompactar .tar.xz +++
tar -xvf <archive.tar.xz>
