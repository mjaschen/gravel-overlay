BROUTER_DEV=~/Code/MarcusJaschen/brouter-dev

.PHONY: serve-testmap
serve-testmap:
	python3 -m http.server 8092 --bind 127.0.0.1 --directory ./

.PHONY: browse-testmap
browse-testmap:
	open http://localhost:8092/map.html

style.json: $(HOME)/Downloads/gravel_overlay.json
	mv -v $< $@

gravel-style.json: style.json
	sed -e 's/http:\/\/localhost:8090/https:\/\/map-tiles.m11n.de\/gravel\/vector\/m11n\/data\/v3.json/' style.json > $@

.PHONY: install-in-brouter-web
install-in-brouter-web: gravel-style.json
	cp -v gravel-style.json $(BROUTER_DEV)/brouter-web/layers/mvt/gravel-overlay-style.json
	@echo "Gravel Overlay style copied to BRouter Web layers directory"
	@echo "Change to Brouter Web directory an build application:"
	@echo "-> cd $(BROUTER_DEV)"
	@echo "-> make serve"
