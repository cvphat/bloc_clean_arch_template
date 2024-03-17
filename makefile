clean:
	@melos clean

pub_get:
	@melos bootstrap

pub_upgrade:
	@melos pub_upgrade

gen:
	@melos force_build_all

watch:
	@melos force_watch_all
	
sync:
	@melos bootstrap
	@melos run force_build_all
	@melos run l10n