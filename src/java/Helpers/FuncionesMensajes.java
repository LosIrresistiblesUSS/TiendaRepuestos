package Helpers;

public class FuncionesMensajes {
    public static String insertarExitoso(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-file'></span></strong> " + clase + "<strong> "
                + desc
                + "</strong> insertado correctamente.</div>";
        return mensaje;
    }
    
    public static String insertarAdvertencia(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-warning alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-warning-sign'></span></strong> " + clase + " <strong> "
                + desc
                + "</strong> ya se encuentra registrado.</div>";
        return mensaje;
    }
    
    public static String insertarError(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-danger alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-file'></span></strong> Error al intentar insertar el " + clase + " <strong> "
                + desc
                + ".</strong></div>";
        return mensaje;
    }
    
    public static String buscarError(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-danger' role='alert'> "
                + "<strong>Fatality <span class='glyphicon glyphicon-exclamation-sign'></span></strong>"
                + " No existen " + clase + " que contengan el siguiente texto: <strong>" + desc + "</strong>.</div>";
        return mensaje;
    }
    
    public static String buscarExitoso(String desc){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-search'></span></strong> Resultados de busqueda que contienen el texto<strong>: "
                + desc
                + "</strong>.</div>";
        return mensaje;
    }
    
    public static String actualizarExitoso(String clase, String descAnt, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-pencil'></span> </strong>" + clase + " <strong>"
                + descAnt
                + "</strong> actualizado correctamente por <strong>" + desc + "</strong>.</div>";
        return mensaje;
    }
    
    public static String actualizarAdvertencia(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-warning alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-warning-sign'></span></strong> " + clase + " <strong>"
                + desc
                + "</strong> ya se encuentra registrado.</div>";
        return mensaje;
    }
    
    public static String actualizarError(String clase, String descAnt, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-danger alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-pencil'></span> </strong>Error al intentar actualizar el " + clase + " <strong>"
                + descAnt + "</strong>"
                + " por <strong>" + desc + "</strong></div>";
        return mensaje;
    }
    
    //--------ACTUALIZACIÓN EMPLEADO----------------------------------------------
    
    public static String actualizarExitoso2(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-pencil'></span></strong> Algún Campo del " + clase + " <strong>"
                + desc + "</strong> a sido actualizado correctamente.</div>";
        return mensaje;
    }
    
    public static String actualizarAdvertencia2(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-warning alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-warning-sign'></span> </strong>Algún <strong>" + clase + "</strong> con el Nro. de Documento  <strong>"
                + desc
                + "</strong> ya se encuentra registrado.</div>";
        return mensaje;
    }
    
    public static String actualizarError2(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-danger alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-pencil'></span> </strong>Error al intentar actualizar algún campo del " + clase + " <strong>"
                + desc + "</strong>";
        return mensaje;
    }
    
    //------------------------------------------------------
    
    public static String eliminarExitoso(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-trash'></span> </strong>" + clase + " <strong>"
                + desc
                + "</strong> eliminado correctamente.</div>";
        return mensaje;
    }
    
    public static String eliminarError(String clase, String desc){
        String mensaje = "<div class='alert alert-mensajes alert-danger alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong>Advertencia! </strong>Error al intentar eliminar el " + clase + " <strong>"
                + desc + "</strong>.</div>";
        return mensaje;
    }
    
    public static String AnularExitoso(String clase){
        String mensaje = "<div class='alert alert-mensajes alert-success alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong><span class='glyphicon glyphicon-trash'></span> </strong> Estado de <strong>"
                + clase 
                + "</strong> cambiado correctamente.</div>";
        return mensaje;
    }
    
    public static String AnularError(String clase){
        String mensaje = "<div class='alert alert-mensajes alert-danger alert-dismissible' role='alert'>"
                + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>"
                + "<strong>Advertencia! </strong>Error al intentar intentar cambiar el estado de <strong>" + clase + ". </strong>.</div>";
        return mensaje;
    }
    
}
