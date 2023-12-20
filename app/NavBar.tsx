import { Container, Flex } from '@radix-ui/themes';
import Link from 'next/link';
import { GiCrownedSkull } from 'react-icons/gi';

const NavBar = () => {
  return (
    <nav className="border-b mb-5 px-5 py-3">
      <Container>
        <Flex justify="between">
          <Flex align="center" gap="3">
            <Link href="/">
              <GiCrownedSkull className="w-10 h-10 mr-2" />
            </Link>
            <NavLinks />
          </Flex>
          <div>Login</div>
        </Flex>
      </Container>
    </nav>
  );
};

const NavLinks = () => {
  const links = [
    { label: 'Home', href: '/' },
    { label: 'Players', href: '/players' },
    { label: 'Games', href: '/games' },
  ];
  return (
    <ul className="flex space-x-6">
      {links.map(({ href, label }) => (
        <li key={label}>
          <Link href={href} className="text-zinc-900 hover:text-zinc-400">
            {/* className="text-zinc-900 dark:text-gray-300 hover:text-zinc-400 dark:hover:text-white" */}
            {label}
          </Link>
        </li>
      ))}
    </ul>
  );
};

export default NavBar;
