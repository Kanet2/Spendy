class Config:
    SECRET_KEY  = 'sabadaBADABUDFJLSDFSHGQHGOIHhohihoiHOIFH'
    DEBUG       = True

class DevelopmentConfig(Config):
    
    MYSQL_HOST      = 'localhost'
    MYSQL_USER      = 'root'
    MYSQL_PASSWORD  = 'mysql'
    MYSQL_DB        = 'spendy'
    
    
    # Python anywhere
    '''
    MYSQL_HOST      = 'spendy.mysql.pythonanywhere-services.com'
    MYSQL_USER      = 'spendy'
    MYSQL_PASSWORD  = 'mysqlhola'
    MYSQL_DB        = 'spendy$spendy'
    '''
class MailConfig(Config):
    MAIL_SERVER         = 'smtp.gmail.com'
    MAIL_PORT           = 587
    MAIL_USE_TLS        = True
    MAIL_USE_SSL        = False
    MAIL_USERNAME       = 'kanet.ochoa1921@alumnos.udg.mx'
    MAIL_PASSWORD       = 'ulsb feod yhbt awpp'
    MAIL_DEFAULT_SENDER = 'kanet.ochoa1921@alumnos.udg.mx'
    MAIL_ASCII_ATTACHMENTS   = True 
config = {
    'development': DevelopmentConfig,
    'mail'       : MailConfig
}
    