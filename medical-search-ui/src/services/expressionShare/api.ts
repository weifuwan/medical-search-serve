import { request } from '@umijs/max';

export type ShareScope = 'USERS' | 'HOSPITAL';
export type SharePermission = 'READ' | 'EDIT';

export interface ShareInput {
  title: string;
  expression: string;
  scope?: ShareScope;
  permission?: SharePermission;
  userIds?: number[];
  expiresInDays?: number;
  version?: number;
}

export interface ShareUser {
  userId: number;
  userName: string;
  loginId: string;
}

export interface ShareItem {
  id: string;
  code: string;
  title: string;
  expression: string;
  ownerId: number;
  scope: ShareScope;
  permission: SharePermission;
  status: 'ACTIVE' | 'REVOKED';
  expiresAt: string;
  version: number;
  canEdit: boolean;
  canManage: boolean;
  userIds?: number[];
  users?: ShareUser[];
  createdAt?: string;
  updatedAt?: string;
}

export interface FavoriteItem {
  id: string;
  title: string;
  expression: string;
  originShareId?: string;
  createdAt: string;
}

export interface ShareLog {
  userId: number;
  userName?: string;
  action: string;
  createdAt: string;
}

interface ApiResult<T> {
  code: number;
  msg?: string;
  data: T;
}

const baseUrl = '/medical-search-admin/share/expression';
const sharePath = (code: string) => baseUrl + '/' + encodeURIComponent(code);

export const shareLink = (code: string) => window.location.origin + '/share/' + code;

export const createShare = (data: ShareInput) =>
  request<ApiResult<ShareItem>>(baseUrl, { method: 'POST', data });

export const getShare = (code: string) =>
  request<ApiResult<ShareItem>>(sharePath(code));

export const updateShare = (code: string, data: ShareInput) =>
  request<ApiResult<ShareItem>>(sharePath(code), { method: 'PUT', data });

export const revokeShare = (code: string) =>
  request<ApiResult<void>>(sharePath(code) + '/revoke', { method: 'POST' });

export const getMyShares = () =>
  request<ApiResult<ShareItem[]>>(baseUrl + '/mine');

export const getReceivedShares = () =>
  request<ApiResult<ShareItem[]>>(baseUrl + '/received');

export const getShareUsers = (keyword: string) =>
  request<ApiResult<ShareUser[]>>(baseUrl + '/users', { params: { keyword } });

export const getShareUsage = (code: string) =>
  request<ApiResult<ShareLog[]>>(sharePath(code) + '/usage');

export const addFavorite = (title: string, expression: string) =>
  request<ApiResult<{ id: string }>>(baseUrl + '/favorites', {
    method: 'POST',
    data: { title, expression },
  });

export const copyShareToFavorite = (code: string) =>
  request<ApiResult<{ id: string }>>(sharePath(code) + '/copy', { method: 'POST' });

export const getFavorites = () =>
  request<ApiResult<FavoriteItem[]>>(baseUrl + '/favorites');

export const deleteFavorite = (id: string) =>
  request<ApiResult<void>>(baseUrl + '/favorites/' + encodeURIComponent(id), { method: 'DELETE' });
