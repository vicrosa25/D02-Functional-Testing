start transaction;

use `acme-madruga`;

revoke all privileges on `acme-madruga`.* from 'acme-user'@'%';

revoke all privileges on `acme-madruga`.* from 'acme-manager'@'%';

drop user 'acme-user'@'%';

drop user 'acme-manager'@'%';

drop database `acme-madruga`;

commit;