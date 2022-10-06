<?php
// ** Database settings - You can get this info from your web host ** //
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );


//redis
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_REDIS_DATABASE', 0);
define('WP_CACHE', true);

//saults https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         '0+y8Dt@@x{L`q=.2{L7NB!;ch3Wkr..P+.hZv>-XmMU)=zjhQ=maZ7O8wCXNAB>m');
define('SECURE_AUTH_KEY',  'g>[GabL cUvu,ACAr8tYT8MD>bvW#zi]J/qPEF^t-bZmG--}<uDypR4SZDX1Y;^x');
define('LOGGED_IN_KEY',    ' 8CNJ!oC7S+oIf569KrO4KXTMZmdjL/QD&2vM|-|!H^*7oG5aRN#$)<a1/6]d5lG');
define('NONCE_KEY',        'PEuZq|y;1J)P1e-xyxJG+Do`@zD3;)>}nLqG~)|ejl|Uo8!!`=D3WX(O6U)6LgU{');
define('AUTH_SALT',        'vIh-2IR%|^VU^J@4=d(&oDI!{4e<2(_x=%22?-ran20M0(|?3HLASKF ,uK1]/j4');
define('SECURE_AUTH_SALT', '|`M/%jRl(#f+#> g2>G}v7,m3YnB111^w~Y`RC%pEl$<;VK0{0wn7+;>T#|LNu-%');
define('LOGGED_IN_SALT',   'Q+FUtI3h!*+s4e;W]+-D<+XVC[B4~27-k#LC3(s Rqk:7Lr{B9Ci3_}bWiyO+,ot');
define('NONCE_SALT',       ';|B CvAJS+8gb,hw9.l kEN3&_lZr_la1h^).nA|iAg$.|5[.Ti93(g,w(i8&^h-');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';