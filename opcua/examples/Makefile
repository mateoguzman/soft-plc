all: tutorial_pubsub_mqtt_publish tutorial_pubsub_mqtt_subscribe

tutorial_pubsub_mqtt_subscribe : tutorial_pubsub_mqtt_subscribe.c
	gcc -std=c99 -I /opt/open62541/src/pubsub/ -I /opt/open62541/deps/ -I /opt/open62541/plugins/ \
	-DUA_ARCHITECTURE_POSIX -DUA_ENABLE_JSON_ENCODING \
	tutorial_pubsub_mqtt_subscribe.c -o tutorial_pubsub_mqtt_subscribe \
	-lopen62541 /usr/lib/libmbedtls.so /usr/lib/libmbedx509.so /usr/lib/libmbedcrypto.so -lm -lpthread -lrt

tutorial_pubsub_mqtt_publish : tutorial_pubsub_mqtt_publish.c
	gcc -std=c99 -I /opt/open62541/src/pubsub/ -I /opt/open62541/deps/ -I /opt/open62541/plugins/ \
	-DUA_ARCHITECTURE_POSIX -DUA_ENABLE_JSON_ENCODING \
	tutorial_pubsub_mqtt_publish.c -o tutorial_pubsub_mqtt_publish \
	-lopen62541 /usr/lib/libmbedtls.so /usr/lib/libmbedx509.so /usr/lib/libmbedcrypto.so -lm -lpthread -lrt

test-subscribe: tutorial_pubsub_mqtt_subscribe
	./tutorial_pubsub_mqtt_subscribe --url opc.mqtt://mosquitto:1883

test-publish: tutorial_pubsub_mqtt_publish
	./tutorial_pubsub_mqtt_publish --url opc.mqtt://mosquitto:1883

clean :
	rm tutorial_pubsub_mqtt_subscribe tutorial_pubsub_mqtt_publish
 