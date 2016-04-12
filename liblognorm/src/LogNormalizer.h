// See the file "COPYING" in the main distribution directory for copyright.

#ifndef BRO_PLUGIN_BRO_LIBLOGNORM_LOGNORMALIZER_H
#define BRO_PLUGIN_BRO_LIBLOGNORM_LOGNORMALIZER_H

extern "C" {
#include <liblognorm.h>
}

namespace plugin {
namespace Bro_Liblognorm {

class LogNormalizer {
public:
	LogNormalizer();
	virtual ~LogNormalizer();

	bool LoadRules(const char* filename);
	bool Normalize(const char* line);

	static void GenerateEvent(const char* name);
protected:
	ln_ctx ctx;
};

}
}

#endif