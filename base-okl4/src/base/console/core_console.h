/*
 * \brief  Console backend for OKL4
 * \author Norman Feske
 * \date   2009-03-25
 */

/*
 * Copyright (C) 2009-2012 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

namespace Okl4 { extern "C" {
#include <l4/kdebug.h>
} }

#include <base/console.h>


namespace Genode
{
	class Core_console : public Console
	{
		protected:

			void _out_char(char c) { Okl4::L4_KDB_PrintChar(c); }
	};
}


