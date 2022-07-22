# Copyright 2022 Timescale Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

EXTENSION = influx
DATA = influx--0.4.sql
MODULE_big = influx
OBJS = influx.o worker.o network.o parser.o cache.o

REGRESS = parse worker inval
REGRESS_OPTS += --load-extension=influx

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

cache.o: cache.c cache.h
influx.o: influx.c influx.h parser.h
network.o: network.c network.h
parser.o: parser.c parser.h
worker.o: worker.c worker.h cache.h influx.h parser.h network.h
