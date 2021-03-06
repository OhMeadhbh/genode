/*
 * \brief  Root client interface
 * \author Norman Feske
 * \date   2006-05-11
 */

/*
 * Copyright (C) 2006-2012 Genode Labs GmbH
 *
 * This file is part of the Genode OS framework, which is distributed
 * under the terms of the GNU General Public License version 2.
 */

#ifndef _INCLUDE__ROOT__CLIENT_H_
#define _INCLUDE__ROOT__CLIENT_H_

#include <root/capability.h>
#include <base/rpc_client.h>

namespace Genode {

	struct Root_client : Rpc_client<Root>
	{
		explicit Root_client(Root_capability root)
		: Rpc_client<Root>(root) { }

		Session_capability session(Session_args const &args) {
			return call<Rpc_session>(args); }

		void upgrade(Session_capability session, Upgrade_args const &args) {
			call<Rpc_upgrade>(session, args); }

		void close(Session_capability session) {
			call<Rpc_close>(session); }
	};
}

#endif /* _INCLUDE__ROOT__CLIENT_H_ */
