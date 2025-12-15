<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\PasswordResets\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class PasswordResetDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly int $userId,
        #[\SensitiveParameter] public readonly ?string $tokenHash,
        public readonly string $selector,
        #[\SensitiveParameter] public readonly ?string $validatorHash,
        public readonly ?string $keyVersion,
        public readonly \DateTimeImmutable $expiresAt,
        public readonly \DateTimeImmutable $createdAt,
        public readonly ?\DateTimeImmutable $usedAt,
        #[\SensitiveParameter] public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion,
        public readonly ?string $userAgent,
    ) {}

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}

