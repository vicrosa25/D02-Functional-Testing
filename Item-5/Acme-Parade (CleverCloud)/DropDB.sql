start transaction;

use `acme-parade`;

revoke all privileges on `acme-parade`.* from 'acme-user'@'%';

revoke all privileges on `acme-parade`.* from 'acme-manager'@'%';

drop user 'acme-user'@'%';

drop user 'acme-manager'@'%';

drop database `acme-parade`;

commit;