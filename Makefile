BROUTER_DEV=~/Code/MarcusJaschen/brouter-dev

.PHONY: serve-testmap
serve-testmap:
	python3 -m http.server 8092 --bind 127.0.0.1 --directory ./

.PHONY: browse-testmap
browse-testmap:
	open http://localhost:8092/map.html

style.json: $(HOME)/Downloads/gravel_overlay.json
	test -f $< && mv -v $< $@ || true

$(HOME)/Downloads/gravel_overlay.json:
	@true

gravel-style.json: style.json
	sed -e 's/http:\/\/gravel:8080\/data\/v3.json/https:\/\/map-tiles.m11n.de\/gravel\/vector\/m11n\/data\/v3.json/' $< > $@

.PHONY: install-in-bikerouter
install-in-bikerouter: gravel-style.json
	cp -v gravel-style.json $(BROUTER_DEV)/brouter-web/layers/mvt/gravel-overlay-style.json
	@echo "Gravel Overlay style copied to BRouter Web layers directory"
	@echo "Change to Brouter Web directory an build application:"
	@echo "-> cd $(BROUTER_DEV)"
	@echo "-> make serve"
