import { useState, useEffect } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router';
import queryString from 'query-string';

type UseApiConfig = Partial<{
  method: 'get' | 'post' | 'put' | 'patch' | 'delete' | 'head';
  data: any;
}>;

export function useApi<T>(path: string, query: object = {}, config: UseApiConfig = {}, callback?: (result: T) => void) {
  const url = `/api/${path}?${queryString.stringify(query)}`;
  const [result, setResult] = useState<T>(null);


  useEffect(() => {
    axios({
      url,
      ...config,
    }).then(({ data }) => {
      setResult(data);

      if (callback) {
        callback(data);
      }
    });
  }, [url]);

  return result;
}

export function useQueryParams() {
  const location = useLocation();
  return queryString.parse(location.search);
}