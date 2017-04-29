bool is_whitespace(char c) {
	switch (c) {
		case ' ': // fallthrough
		case '\t': // fallthrough
		case '\r': // fallthrough
		case '\n':
			return true;
		default: // not whitespace
			return false;
	}
}

