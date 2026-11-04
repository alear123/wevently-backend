package com.wevently.wevently.Imagenes.Services;

import com.wevently.wevently.Base.BaseService;
import com.wevently.wevently.Imagenes.Entities.Imagen;
import com.wevently.wevently.Imagenes.Repository.ImagenRepository;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.stream.Stream;

@Service
public class ImagenService extends BaseService<Imagen,Long, ImagenRepository> {
    private final String rutaBase = System.getProperty("user.dir") + "/imagenes/";

    public ImagenService(ImagenRepository repository) {
        super(repository);
    }

    //Recibe la imagen en formato Base 64, la guarda y retorna la ruta al archivo
    public String guardar(String imagen, Integer idUsuario) throws Exception {
        try {
            // Crear carpeta si no existe
            File directorio = new File(rutaBase+idUsuario);
            if (!directorio.exists()) {
                directorio.mkdirs();
            }
            long numeroArchivos = 0;
            Stream<Path> stream = Files.list(Paths.get(rutaBase+idUsuario));
            numeroArchivos =  stream.filter(Files::isRegularFile).count();

            // Eliminar encabezado (data:image/png;base64,) si existe
            String extension= ".";

            if(imagen.contains("data:image/")){
                 int i = imagen.indexOf("/");
                 int j = imagen.indexOf(";");
                extension += imagen.substring(i+1,j);
            }

            if (imagen.contains(",")) {
                imagen = imagen.split(",")[1];
            }
            imagen = imagen.replace("\"","");
            // Decodificar base64 a bytes
            byte[] imagenBytes = Base64.getDecoder().decode(imagen);

            // Guardar archivo en disco
            String rutaArchivo = directorio.getAbsolutePath() + "/Img_" + numeroArchivos + (!extension.equals(".") ? extension : "");
            Files.write(Paths.get(rutaArchivo), imagenBytes);

            return (rutaArchivo);

        } catch (IOException e) {
            throw new Exception("Se ha producido un error al guardar la imagen");
        }
    }

    public String buscar(String nombreArchivo) {
        try {
            // Ruta completa
            Path ruta = Paths.get(nombreArchivo);

            // Leer bytes del archivo
            byte[] bytes = Files.readAllBytes(ruta);

            // Detectar tipo MIME (opcional)
            String tipoMime = Files.probeContentType(ruta); // ej: "image/png"

            // Codificar en Base64
            String base64 = Base64.getEncoder().encodeToString(bytes);

            // Devolver como data URI (opcional pero útil)
            String base64ConEncabezado = "data:" + tipoMime + ";base64," + base64;

            return base64ConEncabezado;

        } catch (IOException e) {
            System.out.println("Error no se ha encontrado la imagen: "+nombreArchivo);
            return null;
        }
    }

}
