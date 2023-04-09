import { useState, useEffect } from 'react';

const useAxios = (configObj: any) => {
  const {
    axiosInstance,
    method,
    url,
    requestConfig
  } = configObj;

  const [response, setResponse] = useState([]);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const controller = new AbortController();

    const fetchData = async() => {
      try
      {
        const res = await axiosInstance[method.toLowerCase()](url, {
          ...requestConfig,
          signal: controller.signal
        });
        setResponse(res.data);
      }
      catch (err: any)
      {
        setError(err.message);
        console.error(error);
      }
      finally
      {
        setLoading(false);
      }
    }

    fetchData();

    return () => controller.abort();
  },[]);

  return [response, error, loading];
}

export default useAxios;