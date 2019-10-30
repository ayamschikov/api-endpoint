#!/bin/bash

bin/rails db:migrate
bin/rails s -p 80 -b 0.0.0.0
