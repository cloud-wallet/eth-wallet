Ethereum::Singleton.client = :ipc
Ethereum::Singleton.ipcpath = Rails.application.secrets.ipc_path
EthClient = Ethereum::Singleton.instance