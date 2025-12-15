<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\PasswordResets\Joins;

/**
 * Methods generated from foreign keys.
 */
final class PasswordResetsJoins
{
    private function assertAlias(string $s): string
    {
        if (!preg_match('/^[A-Za-z_][A-Za-z0-9_]*$/', $s)) {
            throw new \InvalidArgumentException("Invalid SQL alias: {$s}");
        }
        return $s;
    }

    private function assertAliasPair(string $alias, string $as): array
    {
        $alias = $this->assertAlias($alias);
        $as    = $this->assertAlias($as);
        if ($alias === $as) {
            throw new \InvalidArgumentException("Join alias must differ from base alias: {$alias}");
        }
        return [$alias, $as];
    }

    /**
     * FK: password_resets -> users
     * LEFT JOIN vw_users AS $as ON $as.id = $alias.user_id
     * @return array{0:string,1:array<string,mixed>}
     */
    public function joinUsers(string $alias = 't', string $as = 'j0'): array
    {
        [$alias, $as] = $this->assertAliasPair($alias, $as);
        return [' LEFT JOIN vw_users AS ' . $as . ' ON ' . $as . '.id = ' . $alias . '.user_id' . ' ', []];
    }
}

