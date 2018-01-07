<?php

spl_autoload_register(function($class) {
    $root = __DIR__ . '/..';
    $folders = scandir($root);
    foreach ($folders as $folder) {
        if (!is_dir($folder) || $folder == '.' || $folder == '..') {
            continue;
        }
        $folder = $root . '/' . $folder;
        $inside_folder = scandir($folder);
        foreach ($inside_folder as $file) {
            $file_path = $folder . '/' . $file;
            if (is_file($file_path) && strpos($file, '.php') !== false) {
                $file = str_replace('.php', '', $file);
                if ($file == $class) {
                    require_once $file_path;
                }
            }
        }
    }
});