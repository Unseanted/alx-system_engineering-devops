# First, let's find the Apache process ID
ps aux | grep apache

# Output will show Apache process IDs, pick the appropriate one

# Now, let's attach strace to the Apache process
sudo strace -p <apache_pid>

# Now, in another terminal, trigger the request that causes the 500 error using curl

# Inspect strace output to identify the issue

# Once identified, fix the issue, then automate it using Puppet


# Edit the Apache configuration file
sudo nano /etc/apache2/apache2.conf

# Fix the misconfiguration

# Restart Apache
sudo systemctl restart apache2

# Fixes bad `phpp` extensions to `php` in the WordPress file `wp-settings.php`.

exec { 'fix-wordpress':
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
# Define a Puppet resource to ensure Apache service is running
service { 'apache2':
  ensure => running,
}
