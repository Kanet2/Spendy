class Config:
    SECRET_KEY  = 'sabadaBADABUDFJLSDFSHGQHGOIHhohihoiHOIFH'
    DEBUG       = True

class DevelopmentConfig(Config):
    MYSQL_HOST      = 'localhost'
    MYSQL_USER      = 'root'
    MYSQL_PASSWORD  = 'mysql'
    MYSQL_DB        = 'spendy'


config = {
    'development': DevelopmentConfig
}
    