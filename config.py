class Config:
    SECRET_KEY  = 'sabadaBADABUDFJLSDFSHGQHGOIHhohihoiHOIFH'
    DEBUG       = True

class DevelopmentConfig(Config):
    '''
    MYSQL_HOST      = 'localhost'
    MYSQL_USER      = 'root'
    MYSQL_PASSWORD  = 'mysql'
    MYSQL_DB        = 'spendy'
    '''
    
    # Python anywhere
    MYSQL_HOST      = 'spendy.mysql.pythonanywhere-services.com'
    MYSQL_USER      = 'spendy'
    MYSQL_PASSWORD  = 'mysqlhola'
    MYSQL_DB        = 'spendy$spendy'

config = {
    'development': DevelopmentConfig
}
    