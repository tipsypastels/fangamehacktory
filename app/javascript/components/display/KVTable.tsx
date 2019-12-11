/** @jsx jsx */
import { jsx, css } from '@emotion/core';

type Props = {
  data: { [key: string]: any }
};

export default function KVTable({ data }: Props) {
  return (
    <table css={css`width: 100%`}>
      <tbody>
        {Object.keys(data).map(key => (
          <tr key={key} css={css`
            &:nth-of-type(odd) {
              background-color: var(--highlight-color);
            }

            td {
              padding: 0.25rem 0.5rem;
              margin: 0;
            }
          `}>
            <td>
              {key}
            </td>
            <td>
              {data[key]}
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}