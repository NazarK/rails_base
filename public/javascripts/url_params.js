function getURLParameter(name) {
    return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g, '%20'))||null;
}

function hasURLParameter(name) {
	if(location.search.match(new RegExp("[\?&]"+name+"(&|$)")  )  ) {
		return true;
	} else {
		if(getURLParameter(name)) return true;
	}
	return false;
}

function params(name) {
  return getURLParameter(name);
}