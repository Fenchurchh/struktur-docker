



# Backup Container
docker run --rm --volumes-from 97027a  -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /var/www/html


# Restore Containerdata
docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /var/www/html && tar xvf /backup/backup.tar --strip 1"