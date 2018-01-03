<?php

return array(
    // ----------------------------  CONFIG ENV  -----------------------------//
    'env' => array(
        'language' => 'zh_cn',
        'theme' => 'default'
    ),
    // ----------------------------  CONFIG DB  ----------------------------- //
    'db' => array(
        'host' => '127.0.0.1',
        'port' => '3306',
        'dbname' => 'open42',
        'username' => 'root',
        'password' => 'root',
        'tableprefix' => 'open42_',
        'charset' => 'utf8'
    ),
// -------------------------  CONFIG SECURITY  -------------------------- //
    'security' => array(
        'authkey' => '83804emuuo9Co5UE',
    ),
// --------------------------  CONFIG COOKIE  --------------------------- //
    'cookie' => array(
        'cookiepre' => 'ftNK_',
        'cookiedomain' => '',
        'cookiepath' => '/',
    )
);
