import { AccountForm } from '../models'
import { Http } from 'basic'

export const LoginApi = (data: AccountForm): Promise<String> => {
  return Http.post<string>('/login/account', data)
}