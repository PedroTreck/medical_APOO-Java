package app.config;

public class ConfigurationsPGSQL extends Configurations{
    public ConfigurationsPGSQL() {
        super.TYPE = "postgresql";
        super.HOST = "localhost";
        super.USER = "postgres";
        super.PASS = "";
        super.PORT = "5432";
        super.BASE = "med";
        super.DRIV = "org.postgresql.Driver";
        super.SSL = "&useSSL=false";
        super.TIMEZONE = "&useTimezone=true&serverTimezone=UTC";
    }
}
