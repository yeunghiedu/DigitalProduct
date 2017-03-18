<?php

namespace Kienbt\Digitalproduct\Components;

trait SetsVars
{
    protected function setVar($name, $value)
    {
        $this->{$name} = $this->page[$name] = $value;
    }
}